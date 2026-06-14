/* gsfs_cli.c -- GeOS Simple Filesystem CLI tool for RISC-V Linux guest
 *
 * Reads/writes files on a GSFS-formatted block device (e.g. /dev/vda).
 *
 * GSFS layout (sector = 512 bytes):
 *   Sector 0:    Superblock (magic, version, geometry, free ptr)
 *   Sectors 1-7: Directory (56 entries x 64 bytes = 3584 bytes)
 *   Sectors 8+:  Data area (files stored contiguously)
 *
 * Build: riscv64-linux-gnu-gcc -static -o gsfs_cli gsfs_cli.c
 * Usage: gsfs_cli <device> <command> [args...]
 *
 * Commands:
 *   ls                  List files
 *   read <filename>     Read file to stdout
 *   write <filename>    Write stdin to file (creates or replaces)
 *   delete <filename>   Delete file
 *   cat <filename>      Read file as text (same as read)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#define SECTOR_SIZE      512
#define DIR_SECTORS      7
#define DIR_SECTOR_START 1
#define DATA_SECTOR_START 8
#define DIRENT_SIZE      64
#define MAX_FILENAME_LEN 55
#define MAX_FILES        56

/* Superblock offsets */
#define SB_MAGIC        0   /* u32 LE */
#define SB_VERSION      4   /* u32 LE */
#define SB_TOTAL_SECTORS 8  /* u32 LE */
#define SB_DIR_START    12  /* u32 LE */
#define SB_DIR_COUNT    16  /* u32 LE */
#define SB_DATA_START   20  /* u32 LE */
#define SB_FREE_SECTOR  24  /* u32 LE */
#define SB_FILE_COUNT   28  /* u32 LE */

/* GSFS Magic: "GSFS" = 0x47534653 */
#define GSFS_MAGIC_VAL  0x47534653

/* Directory entry offsets */
#define DE_NAME         0   /* 56 bytes, null-terminated */
#define DE_START_SECTOR 56  /* u32 LE */
#define DE_SIZE         60  /* u32 LE */

static uint32_t read_u32_le(const uint8_t *buf, int off)
{
    return (uint32_t)buf[off] |
           ((uint32_t)buf[off+1] << 8) |
           ((uint32_t)buf[off+2] << 16) |
           ((uint32_t)buf[off+3] << 24);
}

static void write_u32_le(uint8_t *buf, int off, uint32_t val)
{
    buf[off]   = val & 0xFF;
    buf[off+1] = (val >> 8) & 0xFF;
    buf[off+2] = (val >> 16) & 0xFF;
    buf[off+3] = (val >> 24) & 0xFF;
}

/* Read one sector from block device */
static int read_sector(int fd, uint32_t sector, uint8_t *buf)
{
    if (lseek(fd, (off_t)sector * SECTOR_SIZE, SEEK_SET) < 0) {
        perror("lseek");
        return -1;
    }
    ssize_t n = read(fd, buf, SECTOR_SIZE);
    if (n < 0) {
        perror("read");
        return -1;
    }
    if (n == 0) {
        memset(buf, 0, SECTOR_SIZE);
    }
    return 0;
}

/* Write one sector to block device */
static int write_sector(int fd, uint32_t sector, const uint8_t *buf)
{
    if (lseek(fd, (off_t)sector * SECTOR_SIZE, SEEK_SET) < 0) {
        perror("lseek");
        return -1;
    }
    ssize_t n = write(fd, buf, SECTOR_SIZE);
    if (n < 0) {
        perror("write");
        return -1;
    }
    return 0;
}

/* Read directory entry at index (0..55) */
static int read_dirent(int fd, int idx, char *name, uint32_t *start_sector, uint32_t *size)
{
    uint8_t buf[SECTOR_SIZE];
    int sector = DIR_SECTOR_START + (idx * DIRENT_SIZE) / SECTOR_SIZE;
    int offset = (idx * DIRENT_SIZE) % SECTOR_SIZE;

    if (read_sector(fd, sector, buf) < 0)
        return -1;

    memcpy(name, buf + offset, MAX_FILENAME_LEN);
    name[MAX_FILENAME_LEN] = '\0';
    *start_sector = read_u32_le(buf, offset + DE_START_SECTOR);
    *size = read_u32_le(buf, offset + DE_SIZE);

    return 0;
}

/* Write directory entry at index */
static int write_dirent(int fd, int idx, const char *name, uint32_t start_sector, uint32_t size)
{
    uint8_t buf[SECTOR_SIZE];
    int sector = DIR_SECTOR_START + (idx * DIRENT_SIZE) / SECTOR_SIZE;
    int offset = (idx * DIRENT_SIZE) % SECTOR_SIZE;

    if (read_sector(fd, sector, buf) < 0)
        return -1;

    memset(buf + offset, 0, DIRENT_SIZE);
    strncpy((char *)(buf + offset), name, MAX_FILENAME_LEN);
    write_u32_le(buf, offset + DE_START_SECTOR, start_sector);
    write_u32_le(buf, offset + DE_SIZE, size);

    return write_sector(fd, sector, buf);
}

/* Read superblock */
static int read_sb(int fd, uint8_t *sb)
{
    return read_sector(fd, 0, sb);
}

/* Write superblock */
static int write_sb(int fd, const uint8_t *sb)
{
    return write_sector(fd, 0, sb);
}

/* Update superblock field */
static int update_sb_u32(int fd, int off, uint32_t val)
{
    uint8_t sb[SECTOR_SIZE];
    if (read_sb(fd, sb) < 0) return -1;
    write_u32_le(sb, off, val);
    return write_sb(fd, sb);
}

/* Find a directory entry by name, returns index or -1 */
static int find_entry(int fd, const char *name)
{
    uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
    /* Read entire directory */
    for (int i = 0; i < DIR_SECTORS; i++) {
        if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
            return -1;
    }

    for (int i = 0; i < MAX_FILES; i++) {
        int off = i * DIRENT_SIZE;
        if (dbuf[off] != '\0') {
            /* Entry occupied */
            char ename[MAX_FILENAME_LEN + 1];
            memcpy(ename, dbuf + off, MAX_FILENAME_LEN);
            ename[MAX_FILENAME_LEN] = '\0';
            /* Check for exact match (strncmp up to null or MAX_FILENAME_LEN) */
            if (strncmp(ename, name, MAX_FILENAME_LEN) == 0) {
                /* Make sure names match exactly (not just prefix) */
                int nlen = strlen(name);
                if ((nlen < MAX_FILENAME_LEN && ename[nlen] == '\0') || nlen >= MAX_FILENAME_LEN)
                    return i;
            }
        }
    }
    return -1;
}

/* Find a free directory entry */
static int find_free_entry(int fd)
{
    uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
    for (int i = 0; i < DIR_SECTORS; i++) {
        if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
            return -1;
    }
    for (int i = 0; i < MAX_FILES; i++) {
        int off = i * DIRENT_SIZE;
        if (dbuf[off] == '\0')
            return i;
    }
    return -1; /* Directory full */
}

/* ---- Commands ---- */

static int cmd_ls(int fd)
{
    uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
    uint8_t sb[SECTOR_SIZE];

    if (read_sb(fd, sb) < 0) return 1;
    uint32_t magic = read_u32_le(sb, SB_MAGIC);
    if (magic != GSFS_MAGIC_VAL) {
        fprintf(stderr, "error: no GSFS filesystem (magic=0x%08X)\n", magic);
        return 1;
    }

    for (int i = 0; i < DIR_SECTORS; i++) {
        if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
            return 1;
    }

    uint32_t total = read_u32_le(sb, SB_FILE_COUNT);
    printf("total %u files\n", total);
    for (int i = 0; i < MAX_FILES; i++) {
        int off = i * DIRENT_SIZE;
        if (dbuf[off] != '\0') {
            char name[MAX_FILENAME_LEN + 1];
            memcpy(name, dbuf + off, MAX_FILENAME_LEN);
            name[MAX_FILENAME_LEN] = '\0';
            uint32_t sz = read_u32_le(dbuf, off + DE_SIZE);
            uint32_t sector = read_u32_le(dbuf, off + DE_START_SECTOR);
            printf("%-20s %u bytes  sector=%u\n", name, sz, sector);
        }
    }
    return 0;
}

static int cmd_read(int fd, const char *filename)
{
    int idx = find_entry(fd, filename);
    if (idx < 0) {
        fprintf(stderr, "error: file '%s' not found\n", filename);
        return 1;
    }

    uint8_t sb[SECTOR_SIZE];
    if (read_sb(fd, sb) < 0) return 1;

    uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
    for (int i = 0; i < DIR_SECTORS; i++) {
        if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
            return 1;
    }
    int off = idx * DIRENT_SIZE;
    uint32_t start_sector = read_u32_le(dbuf, off + DE_START_SECTOR);
    uint32_t file_size = read_u32_le(dbuf, off + DE_SIZE);

    /* Read file data, sector by sector */
    uint32_t remaining = file_size;
    uint32_t cur_sector = start_sector;
    uint8_t buf[SECTOR_SIZE];

    while (remaining > 0) {
        if (read_sector(fd, cur_sector, buf) < 0)
            return 1;
        uint32_t chunk = remaining < SECTOR_SIZE ? remaining : SECTOR_SIZE;
        fwrite(buf, 1, chunk, stdout);
        remaining -= chunk;
        cur_sector++;
    }
    fflush(stdout);
    return 0;
}

static int cmd_write(int fd, const char *filename)
{
    uint8_t sb[SECTOR_SIZE];
    if (read_sb(fd, sb) < 0) return 1;
    uint32_t magic = read_u32_le(sb, SB_MAGIC);
    if (magic != GSFS_MAGIC_VAL) {
        fprintf(stderr, "error: no GSFS filesystem\n");
        return 1;
    }

    uint32_t total_sectors = read_u32_le(sb, SB_TOTAL_SECTORS);
    uint32_t free_sector = read_u32_le(sb, SB_FREE_SECTOR);
    uint32_t file_count = read_u32_le(sb, SB_FILE_COUNT);
    uint32_t data_start = read_u32_le(sb, SB_DATA_START);

    if (free_sector < data_start) {
        /* If free_sector wasn't set properly, initialize it */
        /* Find last occupied sector by scanning directory */
        uint32_t max_used = data_start;
        uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
        for (int i = 0; i < DIR_SECTORS; i++) {
            if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
                return 1;
        }
        for (int i = 0; i < MAX_FILES; i++) {
            int eoff = i * DIRENT_SIZE;
            if (dbuf[eoff] != '\0') {
                uint32_t s = read_u32_le(dbuf, eoff + DE_START_SECTOR);
                uint32_t sz = read_u32_le(dbuf, eoff + DE_SIZE);
                uint32_t end = s + (sz + SECTOR_SIZE - 1) / SECTOR_SIZE;
                if (end > max_used) max_used = end;
            }
        }
        free_sector = max_used;
    }

    /* Check if file already exists — delete it first */
    int existing_idx = find_entry(fd, filename);
    if (existing_idx >= 0) {
        /* Delete existing entry (mark as empty) */
        uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
        for (int i = 0; i < DIR_SECTORS; i++) {
            if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
                return 1;
        }
        int eoff = existing_idx * DIRENT_SIZE;
        memset(dbuf + eoff, 0, DIRENT_SIZE);
        /* Write back the directory sector */
        int dsector = DIR_SECTOR_START + (existing_idx * DIRENT_SIZE) / SECTOR_SIZE;
        int doff_in_sector = (existing_idx * DIRENT_SIZE) % SECTOR_SIZE;
        /* We need to write the full sector back */
        uint8_t wsect[SECTOR_SIZE];
        if (read_sector(fd, dsector, wsect) < 0) return 1;
        memset(wsect + doff_in_sector, 0, DIRENT_SIZE);
        if (write_sector(fd, dsector, wsect) < 0) return 1;
        file_count--; /* Will need a separate write loop because free sector search is tricky */
        /* For simplicity: just continue with the write below, overwriting the old data area */
    }

    /* Read stdin into buffer */
    uint8_t data[1024 * 1024]; /* 1MB max file size */
    ssize_t total_read = 0;
    ssize_t n;
    while ((n = read(STDIN_FILENO, data + total_read, sizeof(data) - total_read)) > 0) {
        total_read += n;
        if (total_read >= (ssize_t)sizeof(data)) {
            fprintf(stderr, "error: file too large (max 1MB)\n");
            return 1;
        }
    }
    if (n < 0) {
        perror("stdin read");
        return 1;
    }

    uint32_t needed_sectors = (total_read + SECTOR_SIZE - 1) / SECTOR_SIZE;
    if (free_sector + needed_sectors > total_sectors) {
        fprintf(stderr, "error: disk full (need %u sectors, have %u)\n",
                free_sector + needed_sectors, total_sectors);
        return 1;
    }

    /* Find a free directory entry */
    int idx;
    if (existing_idx >= 0) {
        idx = existing_idx; /* reuse old entry */
    } else {
        idx = find_free_entry(fd);
        if (idx < 0) {
            fprintf(stderr, "error: directory full\n");
            return 1;
        }
    }

    /* Write data to sectors starting at free_sector */
    uint8_t buf[SECTOR_SIZE];
    uint32_t remaining = total_read;
    uint32_t cur_sector = free_sector;
    uint32_t data_offset = 0;
    while (remaining > 0) {
        memset(buf, 0, SECTOR_SIZE);
        uint32_t chunk = remaining < SECTOR_SIZE ? remaining : SECTOR_SIZE;
        memcpy(buf, data + data_offset, chunk);
        if (write_sector(fd, cur_sector, buf) < 0) return 1;
        remaining -= chunk;
        data_offset += chunk;
        cur_sector++;
    }

    /* Write directory entry */
    if (write_dirent(fd, idx, filename, free_sector, (uint32_t)total_read) < 0)
        return 1;

    /* Update superblock */
    uint32_t new_free = free_sector + needed_sectors;
    write_u32_le(sb, SB_FREE_SECTOR, new_free);
    if (existing_idx < 0) {
        write_u32_le(sb, SB_FILE_COUNT, file_count + 1);
    }
    if (write_sb(fd, sb) < 0) return 1;

    printf("wrote %zd bytes to '%s' at sector %u (used %u sectors, next free=%u)\n",
           total_read, filename, free_sector, needed_sectors, new_free);
    return 0;
}

static int cmd_delete(int fd, const char *filename)
{
    int idx = find_entry(fd, filename);
    if (idx < 0) {
        fprintf(stderr, "error: file '%s' not found\n", filename);
        return 1;
    }

    uint8_t sb[SECTOR_SIZE];
    if (read_sb(fd, sb) < 0) return 1;

    /* Read directory entry to get start sector */
    uint8_t dbuf[SECTOR_SIZE * DIR_SECTORS];
    for (int i = 0; i < DIR_SECTORS; i++) {
        if (read_sector(fd, DIR_SECTOR_START + i, dbuf + i * SECTOR_SIZE) < 0)
            return 1;
    }
    int eoff = idx * DIRENT_SIZE;
    uint32_t start_sector = read_u32_le(dbuf, eoff + DE_START_SECTOR);
    uint32_t file_size = read_u32_le(dbuf, eoff + DE_SIZE);
    uint32_t file_sectors = (file_size + SECTOR_SIZE - 1) / SECTOR_SIZE;

    /* Clear the directory entry */
    int dsector = DIR_SECTOR_START + (idx * DIRENT_SIZE) / SECTOR_SIZE;
    int doff = (idx * DIRENT_SIZE) % SECTOR_SIZE;
    uint8_t wsect[SECTOR_SIZE];
    if (read_sector(fd, dsector, wsect) < 0) return 1;
    memset(wsect + doff, 0, DIRENT_SIZE);
    if (write_sector(fd, dsector, wsect) < 0) return 1;

    /* Decrease file count */
    uint32_t file_count = read_u32_le(sb, SB_FILE_COUNT);
    if (file_count > 0) {
        write_u32_le(sb, SB_FILE_COUNT, file_count - 1);
    }

    /* Note: We DON'T reclaim the data area for simplicity.
     * The free_sector pointer stays where it is. A future
     * "defrag" command could compact everything. */
    if (write_sb(fd, sb) < 0) return 1;

    printf("deleted '%s' (%u bytes at sector %u)\n", filename, file_size, start_sector);
    return 0;
}

static void usage(const char *prog)
{
    fprintf(stderr, "Usage: %s <device> <command> [args...]\n", prog);
    fprintf(stderr, "Commands:\n");
    fprintf(stderr, "  ls                     List files\n");
    fprintf(stderr, "  read <filename>        Read file to stdout\n");
    fprintf(stderr, "  write <filename>       Write stdin to file\n");
    fprintf(stderr, "  delete <filename>      Delete file\n");
    fprintf(stderr, "  format                 Format device as GSFS (DESTROYS DATA)\n");
}

static int cmd_format(int fd)
{
    uint8_t sb[SECTOR_SIZE];
    memset(sb, 0, SECTOR_SIZE);
    uint32_t total_sectors;

    /* Determine total sectors by seeking to end */
    off_t end = lseek(fd, 0, SEEK_END);
    if (end < 0) {
        perror("lseek end");
        return 1;
    }
    total_sectors = (uint32_t)(end / SECTOR_SIZE);
    if (total_sectors < DATA_SECTOR_START + 1) {
        fprintf(stderr, "error: device too small (%u sectors)\n", total_sectors);
        return 1;
    }

    write_u32_le(sb, SB_MAGIC, GSFS_MAGIC_VAL);
    write_u32_le(sb, SB_VERSION, 1);
    write_u32_le(sb, SB_TOTAL_SECTORS, total_sectors);
    write_u32_le(sb, SB_DIR_START, DIR_SECTOR_START);
    write_u32_le(sb, SB_DIR_COUNT, DIR_SECTORS);
    write_u32_le(sb, SB_DATA_START, DATA_SECTOR_START);
    write_u32_le(sb, SB_FREE_SECTOR, DATA_SECTOR_START);
    write_u32_le(sb, SB_FILE_COUNT, 0);

    if (write_sb(fd, sb) < 0) return 1;

    /* Clear directory sectors */
    uint8_t zero[SECTOR_SIZE];
    memset(zero, 0, SECTOR_SIZE);
    for (int i = 0; i < DIR_SECTORS; i++) {
        if (write_sector(fd, DIR_SECTOR_START + i, zero) < 0)
            return 1;
    }

    printf("formatted %u sectors as GSFS (data area: sectors %u-%u)\n",
           total_sectors, DATA_SECTOR_START, total_sectors - 1);
    return 0;
}

int main(int argc, char **argv)
{
    if (argc < 3) {
        usage(argv[0]);
        return 1;
    }

    const char *device = argv[1];
    const char *cmd = argv[2];

    if (strcmp(cmd, "format") == 0) {
        /* format doesn't need read-write, just write */
        int fd = open(device, O_RDWR);
        if (fd < 0) {
            perror(device);
            return 1;
        }
        int ret = cmd_format(fd);
        close(fd);
        return ret;
    }

    if (strcmp(cmd, "ls") == 0) {
        int fd = open(device, O_RDONLY);
        if (fd < 0) {
            perror(device);
            return 1;
        }
        int ret = cmd_ls(fd);
        close(fd);
        return ret;
    }

    if (strcmp(cmd, "read") == 0 || strcmp(cmd, "cat") == 0) {
        if (argc < 4) {
            fprintf(stderr, "usage: %s %s read <filename>\n", argv[0], device);
            return 1;
        }
        int fd = open(device, O_RDONLY);
        if (fd < 0) {
            perror(device);
            return 1;
        }
        int ret = cmd_read(fd, argv[3]);
        close(fd);
        return ret;
    }

    if (strcmp(cmd, "write") == 0) {
        if (argc < 4) {
            fprintf(stderr, "usage: %s %s write <filename>\n", argv[0], device);
            return 1;
        }
        int fd = open(device, O_RDWR);
        if (fd < 0) {
            perror(device);
            return 1;
        }
        int ret = cmd_write(fd, argv[3]);
        close(fd);
        return ret;
    }

    if (strcmp(cmd, "delete") == 0) {
        if (argc < 4) {
            fprintf(stderr, "usage: %s %s delete <filename>\n", argv[0], device);
            return 1;
        }
        int fd = open(device, O_RDWR);
        if (fd < 0) {
            perror(device);
            return 1;
        }
        int ret = cmd_delete(fd, argv[3]);
        close(fd);
        return ret;
    }

    fprintf(stderr, "unknown command: %s\n", cmd);
    usage(argv[0]);
    return 1;
}
