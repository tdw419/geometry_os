/* init_mp.c — Self-contained Pixel Linux init with Memory Palace GSFS support
 * RV32 freestanding (no libc). Uses SBI ecalls for console I/O.
 *
 * Build: riscv64-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -nostdlib -ffreestanding \
 *         -static -o init_mp init_mp.c
 * Initramfs: copy init_mp as 'init', create /dev /proc /sys /tmp dirs
 */
 
/* ======= Type definitions (freestanding) ======= */
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

/* ======= SBI ecall wrappers (no libc) ======= */
#define SBI_CONSOLE_PUTCHAR 0x01
#define SBI_CONSOLE_GETCHAR 0x02

static void sbi_putchar(char c) {
    register uint32_t a7 asm("a7") = SBI_CONSOLE_PUTCHAR;
    register uint32_t a0 asm("a0") = (unsigned char)c;
    asm volatile("ecall" : : "r"(a0), "r"(a7) : "memory");
}

static int sbi_getchar(void) {
    register uint32_t a7 asm("a7") = SBI_CONSOLE_GETCHAR;
    register uint32_t a0 asm("a0");
    asm volatile("ecall" : "=r"(a0) : "r"(a7) : "memory");
    return (int)a0;
}

/* ======= Minimal I/O ======= */
static void puts(const char *s) {
    while (*s) sbi_putchar(*s++);
}

static void puthex32(uint32_t v) {
    const char hex[] = "0123456789ABCDEF";
    for (int i = 7; i >= 0; i--) {
        sbi_putchar(hex[(v >> (i * 4)) & 0xF]);
    }
}

static void putdec32(uint32_t v) {
    char buf[12];
    int i = 11;
    buf[11] = 0;
    do { buf[--i] = '0' + (v % 10); v /= 10; } while (v);
    puts(&buf[i]);
}

/* Read a line from SBI console */
static int readline(char *buf, int max) {
    int i = 0;
    while (i < max - 1) {
        int c = sbi_getchar();
        if (c < 0) continue;
        if (c == '\r' || c == '\n') {
            buf[i] = 0;
            sbi_putchar('\n');
            return i;
        }
        if (c == '\b' || c == 0x7F) {
            if (i > 0) { i--; puts("\b \b"); }
            continue;
        }
        if (c >= ' ') {
            buf[i++] = c;
            sbi_putchar(c);
        }
    }
    buf[i] = 0;
    return i;
}

/* ======= GSFS format constants ======= */
#define SECTOR_SIZE      512
#define DIR_SECTORS      7
#define DIR_SECTOR_START 1
#define DATA_SECTOR_START 8
#define DIRENT_SIZE      64
#define MAX_FILENAME_LEN 55
#define MAX_FILES        56

#define SB_MAGIC        0
#define SB_VERSION      4
#define SB_TOTAL_SECTORS 8
#define SB_DIR_START    12
#define SB_DIR_COUNT    16
#define SB_DATA_START   20
#define SB_FREE_SECTOR  24
#define SB_FILE_COUNT   28

#define GSFS_MAGIC_VAL  0x47534653
#define VDA_BASE        0x10001000

/* ======= VirtIO block device access ======= */
/* We read/write /dev/vda via SBI custom ecalls (0x200=DISK_READ, 0x201=DISK_WRITE) */
#define SBI_DISK_READ   0x200
#define SBI_DISK_WRITE  0x201

/* Buffer for sector data (must be accessible to SBI DMA) */
static uint8_t sector_buf[SECTOR_SIZE] __attribute__((aligned(512)));

static int disk_read(uint32_t sector) {
    register uint32_t a7 asm("a7") = SBI_DISK_READ;
    register uint32_t a0 asm("a0") = sector;
    register uint32_t a1 asm("a1") = (uint32_t)sector_buf;
    uint32_t ret;
    asm volatile("ecall" : "=r"(ret) : "r"(a0), "r"(a1), "r"(a7) : "memory");
    return (ret == 0) ? 0 : -1;
}

static int disk_write(uint32_t sector) {
    register uint32_t a7 asm("a7") = SBI_DISK_WRITE;
    register uint32_t a0 asm("a0") = sector;
    register uint32_t a1 asm("a1") = (uint32_t)sector_buf;
    uint32_t ret;
    asm volatile("ecall" : "=r"(ret) : "r"(a0), "r"(a1), "r"(a7) : "memory");
    return (ret == 0) ? 0 : -1;
}

static uint32_t r32(const uint8_t *b, int o) {
    return (uint32_t)b[o] | ((uint32_t)b[o+1]<<8) |
           ((uint32_t)b[o+2]<<16) | ((uint32_t)b[o+3]<<24);
}
static void w32(uint8_t *b, int o, uint32_t v) {
    b[o]=v&0xFF; b[o+1]=(v>>8)&0xFF;
    b[o+2]=(v>>16)&0xFF; b[o+3]=(v>>24)&0xFF;
}

static int rd_sec(uint32_t sec) {
    return disk_read(sec);
}
static int wr_sec(uint32_t sec) {
    return disk_write(sec);
}

static int find_entry(const char *name) {
    for (int i=0; i<DIR_SECTORS; i++) {
        if (rd_sec(DIR_SECTOR_START+i) < 0) return -1;
        for (int j=0; j<SECTOR_SIZE/DIRENT_SIZE; j++) {
            int off = j*DIRENT_SIZE;
            if (sector_buf[off]==0) continue;
            int idx = i*(SECTOR_SIZE/DIRENT_SIZE) + j;
            if (idx >= MAX_FILES) return -1;
            int match=1;
            for (int k=0; k<MAX_FILENAME_LEN; k++) {
                if (sector_buf[off+k]==0 && name[k]==0) break;
                if (sector_buf[off+k]!=name[k]) { match=0; break; }
                if (name[k]==0 && sector_buf[off+k]!=0) { match=0; break; }
            }
            if (match) return idx;
        }
    }
    return -1;
}

static int find_free(void) {
    for (int i=0; i<DIR_SECTORS; i++) {
        if (rd_sec(DIR_SECTOR_START+i) < 0) return -1;
        for (int j=0; j<SECTOR_SIZE/DIRENT_SIZE; j++) {
            int off = j*DIRENT_SIZE;
            int idx = i*(SECTOR_SIZE/DIRENT_SIZE) + j;
            if (idx>=MAX_FILES) return -1;
            if (sector_buf[off]==0) return idx;
        }
    }
    return -1;
}

static int read_dirent(int idx, char *name, uint32_t *start, uint32_t *size) {
    int si = DIR_SECTOR_START + (idx*DIRENT_SIZE)/SECTOR_SIZE;
    int off = (idx*DIRENT_SIZE)%SECTOR_SIZE;
    if (rd_sec(si) < 0) return -1;
    for (int i=0; i<MAX_FILENAME_LEN; i++) name[i] = sector_buf[off+i];
    name[MAX_FILENAME_LEN]=0;
    *start = r32(sector_buf, off+56);
    *size = r32(sector_buf, off+60);
    return 0;
}

static int write_dirent(int idx, const char *name, uint32_t start, uint32_t size) {
    int si = DIR_SECTOR_START + (idx*DIRENT_SIZE)/SECTOR_SIZE;
    int off = (idx*DIRENT_SIZE)%SECTOR_SIZE;
    if (rd_sec(si) < 0) return -1;
    for (int i=0; i<DIRENT_SIZE; i++) sector_buf[off+i] = 0;
    for (int i=0; name[i] && i<MAX_FILENAME_LEN; i++) sector_buf[off+i] = name[i];
    w32(sector_buf, off+56, start);
    w32(sector_buf, off+60, size);
    return wr_sec(si);
}

static int check_gsfs(void) {
    if (rd_sec(0) < 0) return 0;
    return (r32(sector_buf, SB_MAGIC) == GSFS_MAGIC_VAL);
}

static void cmd_ls(void) {
    if (rd_sec(0) < 0) { puts("error: can't read superblock\n"); return; }
    if (r32(sector_buf, SB_MAGIC) != GSFS_MAGIC_VAL) { puts("error: not GSFS\n"); return; }
    uint32_t total = r32(sector_buf, SB_FILE_COUNT);
    uint32_t free_s = r32(sector_buf, SB_FREE_SECTOR);
    puts("Memory Palace files: "); putdec32(total); puts("\n");
    for (int i=0; i<MAX_FILES; i++) {
        char name[MAX_FILENAME_LEN+1];
        uint32_t start, size;
        if (read_dirent(i, name, &start, &size)==0 && name[0]!=0) {
            puts("  "); puts(name);
            for (int s=0; s<30; s++) if (!name[s]) { for (int sp=s; sp<30; sp++) sbi_putchar(' '); break; }
            puts(" "); putdec32(size); puts(" B  sect="); putdec32(start); puts("\n");
        }
    }
    puts("Free sector: "); putdec32(free_s); puts("\n");
}

static void cmd_read(const char *name) {
    int idx = find_entry(name);
    if (idx<0) { puts("error: not found: "); puts(name); puts("\n"); return; }
    uint32_t start, size;
    char fname[MAX_FILENAME_LEN+1];
    if (read_dirent(idx, fname, &start, &size) < 0) return;
    uint32_t remaining = size;
    uint32_t cur = start;
    while (remaining > 0) {
        if (rd_sec(cur) < 0) return;
        uint32_t chunk = remaining < SECTOR_SIZE ? remaining : SECTOR_SIZE;
        for (uint32_t i=0; i<chunk; i++) sbi_putchar(sector_buf[i]);
        remaining -= chunk;
        cur++;
    }
}

static uint8_t data_buf[1024*1024] __attribute__((aligned(16)));

static void cmd_write(const char *name) {
    if (rd_sec(0) < 0) return;
    if (r32(sector_buf, SB_MAGIC) != GSFS_MAGIC_VAL) { puts("error: no GSFS\n"); return; }
    
    uint32_t total_sectors = r32(sector_buf, SB_TOTAL_SECTORS);
    uint32_t free_sector = r32(sector_buf, SB_FREE_SECTOR);
    uint32_t data_start = r32(sector_buf, SB_DATA_START);
    
    if (free_sector < data_start) {
        uint32_t max_used = data_start;
        for (int i=0; i<MAX_FILES; i++) {
            char n[MAX_FILENAME_LEN+1]; uint32_t s, sz;
            if (read_dirent(i, n, &s, &sz)==0 && n[0]!=0) {
                uint32_t end = s + (sz+SECTOR_SIZE-1)/SECTOR_SIZE;
                if (end > max_used) max_used = end;
            }
        }
        free_sector = max_used;
    }
    
    int existing = find_entry(name);
    if (existing >= 0) {
        int si = DIR_SECTOR_START + (existing*DIRENT_SIZE)/SECTOR_SIZE;
        int off = (existing*DIRENT_SIZE)%SECTOR_SIZE;
        if (rd_sec(si) < 0) return;
        for (int i=0; i<DIRENT_SIZE; i++) sector_buf[off+i] = 0;
        wr_sec(si);
        if (rd_sec(0) < 0) return;
        w32(sector_buf, SB_FILE_COUNT, r32(sector_buf, SB_FILE_COUNT)-1);
        wr_sec(0);
    }
    
    /* Read stdin until EOF (0xFF) or buffer full */
    int total = 0;
    puts("Enter content (Ctrl+D to end):\n");
    while (total < (int)sizeof(data_buf)) {
        int c = sbi_getchar();
        if (c < 0) continue;
        if (c == 4 || c == 0xFF) break; /* Ctrl+D or EOF */
        data_buf[total++] = (uint8_t)c;
    }
    
    uint32_t needed = (total + SECTOR_SIZE -1) / SECTOR_SIZE;
    if (free_sector + needed > total_sectors) {
        puts("disk full\n"); return;
    }
    
    uint32_t cur_s = free_sector;
    uint32_t remain = total, off = 0;
    while (remain > 0) {
        for (int i=0; i<SECTOR_SIZE; i++) sector_buf[i] = 0;
        uint32_t ch = remain < SECTOR_SIZE ? remain : SECTOR_SIZE;
        for (uint32_t i=0; i<ch; i++) sector_buf[i] = data_buf[off+i];
        wr_sec(cur_s);
        remain -= ch; off += ch; cur_s++;
    }
    
    int idx = existing>=0 ? existing : find_free();
    if (idx<0) { puts("dir full\n"); return; }
    
    write_dirent(idx, name, free_sector, total);
    if (rd_sec(0) < 0) return;
    w32(sector_buf, SB_FREE_SECTOR, free_sector + needed);
    if (existing<0) w32(sector_buf, SB_FILE_COUNT, r32(sector_buf, SB_FILE_COUNT)+1);
    wr_sec(0);
    
    puts("wrote "); putdec32(total); puts(" bytes to '"); puts(name); puts("'\n");
}

static void cmd_delete(const char *name) {
    int idx = find_entry(name);
    if (idx<0) { puts("error: not found\n"); return; }
    uint32_t start, size;
    char n[MAX_FILENAME_LEN+1];
    read_dirent(idx, n, &start, &size);
    
    int si = DIR_SECTOR_START + (idx*DIRENT_SIZE)/SECTOR_SIZE;
    int off = (idx*DIRENT_SIZE)%SECTOR_SIZE;
    if (rd_sec(si) < 0) return;
    for (int i=0; i<DIRENT_SIZE; i++) sector_buf[off+i] = 0;
    wr_sec(si);
    
    if (rd_sec(0) < 0) return;
    uint32_t fc = r32(sector_buf, SB_FILE_COUNT);
    if (fc>0) w32(sector_buf, SB_FILE_COUNT, fc-1);
    wr_sec(0);
    
    puts("deleted '"); puts(n); puts("' ("); putdec32(size); puts(" bytes)\n");
}

static void cmd_stats(void) {
    if (rd_sec(0) < 0) { puts("can't read superblock\n"); return; }
    if (r32(sector_buf, SB_MAGIC) != GSFS_MAGIC_VAL) {
        puts("No GSFS filesystem. Magic=0x"); puthex32(r32(sector_buf, SB_MAGIC)); puts("\n");
        return;
    }
    uint32_t total_sec = r32(sector_buf, SB_TOTAL_SECTORS);
    uint32_t file_cnt = r32(sector_buf, SB_FILE_COUNT);
    uint32_t free_s = r32(sector_buf, SB_FREE_SECTOR);
    uint32_t data_start = r32(sector_buf, SB_DATA_START);
    uint32_t data_secs = total_sec - data_start;
    uint32_t used_secs = free_s - data_start;
    puts("Memory Palace (GSFS) stats:\n");
    puts("  Total sectors:  "); putdec32(total_sec); puts(" ("); putdec32(total_sec*512/1024); puts(" KB)\n");
    puts("  Data sectors:   "); putdec32(data_secs); puts(" ("); putdec32(used_secs); puts(" used, "); putdec32(data_secs-used_secs); puts(" free)\n");
    puts("  Files:          "); putdec32(file_cnt); puts("\n");
}

/* ======= String helpers ======= */
static int str_eq(const char *a, const char *b) {
    while (*a && *b && *a == *b) { a++; b++; }
    return *a == *b;
}

static int starts_with(const char *str, const char *prefix) {
    while (*prefix) {
        if (*str != *prefix) return 0;
        str++; prefix++;
    }
    return 1;
}

/* ======= Entry point (no libc) ======= */
void _start(void) {
    puts("\n");
    puts("  .--. _                   _____ _          \n");
    puts(" / / _` |                |  __ (_)         \n");
    puts("/ / (_| | __ _ _ __   ___| |__) | _ __   ___\n");
    puts("\\ \\__,_|/ _` | '_ \\ / _ \\  ___/ | '_ \\ / _ \\\n");
    puts(" \\ \\__,_| (_| | |_) |  __/ |   | | | | |  __/\n");
    puts("  \\____/\\__,_| .__/ \\___\\_|   |_|_| |_|\\___|\n");
    puts("             | |                              \n");
    puts("             |_|        Memory Palace Edition \n");
    puts("============================================\n");
    
    if (check_gsfs()) {
        cmd_stats();
    } else {
        puts("[MP] No GSFS filesystem detected.\n");
    }
    puts("============================================\n");
    
    char line[512];
    while (1) {
        puts("\nmpalace> ");
        readline(line, sizeof(line));
        
        if (line[0]==0) continue;
        
        if (str_eq(line, "exit") || str_eq(line, "halt") || str_eq(line, "quit"))
            break;
        
        if (str_eq(line, "help")) {
            puts("Commands:\n");
            puts("  ls                 List Memory Palace files\n");
            puts("  read <name>        Read a file\n");
            puts("  write <name>       Write stdin to file (Ctrl+D to end)\n");
            puts("  delete <name>      Delete a file\n");
            puts("  stats              Show disk stats\n");
            puts("  exit / halt        Shutdown\n");
            puts("  help               This help\n");
            continue;
        }
        
        if (str_eq(line, "ls")) { cmd_ls(); continue; }
        if (str_eq(line, "stats")) { cmd_stats(); continue; }
        
        if (starts_with(line, "read ")) { cmd_read(line+5); continue; }
        if (starts_with(line, "delete ")) { cmd_delete(line+7); continue; }
        if (starts_with(line, "write ")) { cmd_write(line+6); continue; }
        
        puts("Unknown: '"); puts(line); puts("' (try help)\n");
    }
    
    puts("\nPalace saved. Halting.\n");
    
    /* Halt via wfi */
    asm volatile("wfi");
    while(1) asm volatile("wfi");
}
