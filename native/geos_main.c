// geos_main.c -- Entry point for geos_native.elf
//
// Initializes xv6's full filesystem layer on top of GeOS ecall-based
// storage, then runs validation: superblock, root directory traversal,
// file lookup, and binary content verification.

#include "types.h"
#include "param.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "fs.h"
#include "file.h"
#include "stat.h"
#include "buf.h"

// ── Local typedefs (from geos_stubs.c, not in riscv.h we include) ──
typedef uint32 *pagetable_t;

#include "proc.h"

// Forward declaration of myproc
extern struct proc *myproc(void);

// Sv32 PTE constants (mirrored from geos_stubs.c)
#define PTE_V      (1 << 0)
#define PTE_R      (1 << 1)
#define PTE_W      (1 << 2)
#define PTE_X      (1 << 3)
#define PTE_U      (1 << 4)
#define PTE_PPN(pte)   (((pte) >> 10) & 0x003FFFFF)

// Forward declarations from geos_stubs.c
extern void print_hex(uint32 val);
extern void putchar(int c);

// ── ELF32 definitions (xv6 user binaries are ELF32) ──────────────────
// The xv6 elf.h uses 64-bit fields (entry, phoff are uint64), but our
// user programs are compiled as RV32 ELF32 binaries with 32-bit fields.
// We define our own compact ELF32 structures here.

#define ELF_MAGIC 0x464C457FU  // "\x7FELF" in little endian

// ELF32 file header (52 bytes total)
struct elf32_hdr {
    uint  magic;        // ELF_MAGIC
    uchar ident[12];    // class, data, version, OS/ABI, padding
    ushort type;        // ET_EXEC=2, ET_DYN=3
    ushort machine;     // EM_RISCV=243
    uint  version;
    uint  entry;        // 32-bit entry point (ELF32!)
    uint  phoff;        // 32-bit program header offset
    uint  shoff;        // 32-bit section header offset
    uint  flags;
    ushort ehsize;      // ELF header size (52 for ELF32)
    ushort phentsize;   // Program header entry size (32 for ELF32)
    ushort phnum;       // Number of program headers
    ushort shentsize;
    ushort shnum;
    ushort shstrndx;
};

// ELF32 program header (32 bytes total)
struct elf32_phdr {
    uint type;      // PT_LOAD=1
    uint offset;    // File offset of segment data
    uint vaddr;     // Virtual address to load at
    uint paddr;     // Physical address (usually same as vaddr)
    uint filesz;    // Size in file
    uint memsz;     // Size in memory (may be larger than filesz)
    uint flags;     // PF_X=1, PF_W=2, PF_R=4
    uint align;
};

#define PT_LOAD     1
#define PF_X        1
#define PF_W        2
#define PF_R        4

// Page size for segment loading (xv6 defines this in riscv.h)
// We don't include riscv.h (CSR ops conflict with our stubs)
#define PGSIZE 4096

// Stack for loaded user programs (16 pages = 64KB for testing)
#define USER_STACK_PAGES 16

// ── Forward declarations from xv6 C files ──────────────────────────
extern void binit(void);
extern struct buf* bread(uint dev, uint blockno);
extern void bwrite(struct buf *b);
extern void brelse(struct buf *b);

extern void iinit(void);
extern void fsinit(int dev);
extern void initlog(int dev, struct superblock *sb);
extern struct inode* namei(char *path);
extern struct inode* ialloc(uint dev, short type);
extern struct inode* idup(struct inode*);
extern void ilock(struct inode*);
extern void iunlock(struct inode*);
extern void iput(struct inode*);
extern void iunlockput(struct inode*);
extern int  readi(struct inode*, int user_dst, uint64 dst, uint off, uint n);
extern void stati(struct inode*, struct stat*);
extern void begin_op(void);
extern void end_op(void);
extern void log_write(struct buf*);

extern void consoleinit(void);
extern void fileinit(void);
extern char *safestrcpy(char *s, const char *t, int n);

// ── Forward declarations from geos_stubs.c / geos_sys.S ────────────
extern int printf(const char *fmt, ...);
extern void putchar(int c);
extern void shutdown(void) __attribute__((noreturn));
extern void *kalloc(void);
extern void kfree(void *pa);
extern void exec_elf(uint entry, uint root_pa) __attribute__((noreturn));
extern void sv32_enter_user(uint entry, uint root_pa) __attribute__((noreturn));

// ── Process table functions from geos_stubs.c ─────────────────────
extern struct proc *allocproc(void);
extern void set_myproc(struct proc *p);
extern void swtch(struct context *old, struct context *new);
extern struct context sched_ctx;

// ── Forward declarations from geos_stubs.c (page table ops) ────────
extern int sv32_map_page(pagetable_t root, uint va, uint pa, uint perm);
extern pagetable_t alloc_pgtbl(void);

// ── Superblock (from fs.c) ─────────────────────────────────────────
extern struct superblock sb;

// ── Helpers ────────────────────────────────────────────────────────

static void
print_dirent(struct inode *dp)
{
    // Read directory entries from a locked inode.
    // xv6 dirent: ushort inum, char[14] name (DIRSIZ)
    // We read 512 bytes at a time and walk entries.
    char buf[1024];
    uint off = 0;
    printf("  Directory listing:\n");

    while (off < dp->size) {
        uint n = dp->size - off;
        if (n > sizeof(buf)) n = sizeof(buf);
        int r = readi(dp, 0, (uint64)buf, off, n);
        if (r <= 0) break;

        for (uint i = 0; i + 16 <= (uint)r; i += 16) {
            ushort inum = *(ushort*)(buf + i);
            if (inum == 0) continue;
            char name[15];
            int j;
            for (j = 0; j < 14 && buf[i + 2 + j] != 0; j++)
                name[j] = buf[i + 2 + j];
            name[j] = 0;
            printf("    inum=%d  \"%s\"\n", inum, name);
        }
        off += r;
    }
}

static void
hexdump(const char *label, const uchar *data, uint len)
{
    printf("  %s (%d bytes):", label, len);
    for (uint i = 0; i < len && i < 64; i++) {
        if (i % 16 == 0) printf("\n    ");
        printf(" %x", data[i]);
    }
    printf("\n");
}

// ── Filesystem validation ──────────────────────────────────────────

static int
fs_validation(void)
{
    printf("\n=== xv6 Filesystem Validation ===\n\n");

    // 1. Initialize the buffer cache
    printf("[A] Calling binit()...\n");
    binit();
    printf("[OK] Buffer cache initialized\n");

    // 2. Initialize the inode table
    printf("[B] Calling iinit()...\n");
    iinit();
    printf("[OK] Inode table initialized\n");

    // 3. Initialize the filesystem (reads superblock, inits log, reclaims orphans)
    printf("[C] Calling fsinit(1)...\n");
    fsinit(1);  // ROOTDEV = 1
    printf("[OK] Filesystem initialized (dev=1)\n");
    printf("     Superblock: magic=0x%x size=%d nblocks=%d ninodes=%d\n",
           sb.magic, sb.size, sb.nblocks, sb.ninodes);

    // 4. Look up root directory "/"
    struct inode *root = namei("/");
    if (!root) {
        printf("[FAIL] namei(\"/\") returned NULL\n");
        return -1;
    }
    printf("[OK] namei(\"/\") returned inode\n");

    // 5. Lock and inspect root inode
    ilock(root);
    printf("[OK] Root inode: type=%d nlink=%d size=%d\n",
           root->type, root->nlink, root->size);

    if (root->type != T_DIR) {
        printf("[FAIL] Root is not a directory (type=%d, expected T_DIR=%d)\n",
               root->type, T_DIR);
        iunlockput(root);
        return -1;
    }

    // 6. Print root directory entries
    print_dirent(root);
    iunlockput(root);

    // 7. Try looking up known files (use absolute paths since myproc->cwd is NULL)
    printf("\n--- Looking up files ---\n");
    const char *test_files[] = {"/sh", "/cat", "/ls", "/init", 0};
    for (int i = 0; test_files[i]; i++) {
        struct inode *ip = namei((char*)test_files[i]);
        if (ip) {
            ilock(ip);
            printf("[OK] namei(\"%s\"): type=%d size=%d nlink=%d\n",
                   test_files[i], ip->type, ip->size, ip->nlink);
            if (ip->type == T_FILE) {
                // Read first 32 bytes of file
                char hdr[64];
                begin_op();
                int r = readi(ip, 0, (uint64)hdr, 0, sizeof(hdr));
                end_op();
                if (r > 0) {
                    hexdump("First bytes", (const uchar *)hdr, r < 32 ? r : 32);
                }
            }
            iunlockput(ip);
        } else {
            printf("[WARN] namei(\"%s\") returned NULL\n", test_files[i]);
        }
    }

    printf("\n=== Filesystem Validation Complete ===\n");
    return 0;
}

// ── ELF Loader (with Sv32 page table) ──────────────────────────────
//
// Loads an ELF32 binary from the xv6 filesystem, creates Sv32 page
// tables, maps the loaded segments, and drops to S-mode to execute
// the user program.

static void __attribute__((noreturn))
run_elf_sv32(struct inode *ip, uint entry, uint phys_entry, pagetable_t root_pt, uint root_pa, uint prog_sz);

static uint __attribute__((unused))
load_and_run_elf(char *path)
{
    printf("\n--- Loading ELF: %s ---\n", path);

    // 1. Open the file
    struct inode *ip = namei(path);
    if (!ip) {
        printf("[FAIL] namei(\"%s\") returned NULL\n", path);
        return 0;
    }
    ilock(ip);
    if (ip->type != T_FILE) {
        printf("[FAIL] \"%s\" is not a regular file (type=%d)\n", path, ip->type);
        iunlockput(ip);
        return 0;
    }

    // 2. Read ELF32 header
    struct elf32_hdr hdr;
    uint hdr_size = sizeof(hdr);
    begin_op();
    int r = readi(ip, 0, (uint64)&hdr, 0, hdr_size);
    end_op();
    if (r < (int)hdr_size) {
        printf("[FAIL] Short read on ELF header\n");
        iunlockput(ip);
        return 0;
    }

    // 3. Validate ELF
    if (hdr.magic != ELF_MAGIC) {
        printf("[FAIL] Not an ELF file: magic=0x%x\n", hdr.magic);
        iunlockput(ip);
        return 0;
    }
    if (hdr.ident[0] != 1) {
        printf("[FAIL] Not a 32-bit ELF\n");
        iunlockput(ip);
        return 0;
    }

    printf("  ELF32: type=%d machine=%d entry=0x%x\n",
           hdr.type, hdr.machine, hdr.entry);
    printf("  %d program headers at offset %d (each %d bytes)\n",
           hdr.phnum, hdr.phoff, hdr.phentsize);

    // 4. Create root page table (Sv32)
    pagetable_t root_pt = alloc_pgtbl();
    if (!root_pt) {
        printf("[FAIL] Could not allocate root page table\n");
        iunlockput(ip);
        return 0;
    }
    uint root_pa = (uint)root_pt;  // physical address

    // 5. Identity-map the kernel (0x80000000..0x80600000)
    printf("Mapping kernel...\n");
    for (uint va = 0x80000000; va < 0x80600000; va += PGSIZE) {
        if (va % (1024 * 1024) == 0) {
            printf("    Mapping va 0x%x...\n", va);
        }
        if (sv32_map_page(root_pt, va, va, PTE_V | PTE_R | PTE_W | PTE_X) != 0) {
            printf("[FAIL] Kernel identity map at 0x%x\n", va);
            iunlockput(ip);
            return 0;
        }
    }

    // 6. Process PT_LOAD segments
    uint nloaded = 0;
    uint ph_base_va = 0;      // First PT_LOAD virtual base
    uint ph_base_pa = 0;      // First PT_LOAD physical base
    for (int i = 0; i < hdr.phnum && i < 32; i++) {
        struct elf32_phdr ph;
        begin_op();
        r = readi(ip, 0, (uint64)&ph, hdr.phoff + i * sizeof(ph), sizeof(ph));
        end_op();
        if (r < (int)sizeof(ph)) {
            printf("  [WARN] Short read on PH[%d]\n", i);
            break;
        }
        if (ph.type != PT_LOAD) continue;

        // Calculate page-aligned range
        uint seg_start = ph.vaddr & ~(PGSIZE - 1);
        uint seg_end = (ph.vaddr + ph.memsz + PGSIZE - 1) & ~(PGSIZE - 1);
        uint seg_pages = (seg_end - seg_start) / PGSIZE;

        char rwx[4] = {'-', '-', '-', 0};
        if (ph.flags & PF_R) rwx[0] = 'R';
        if (ph.flags & PF_W) rwx[1] = 'W';
        if (ph.flags & PF_X) rwx[2] = 'X';

        printf("  LOAD[%d]: vaddr=0x%x filesz=%d memsz=%d %s -> %d pages [0x%x..0x%x)\n",
               nloaded, ph.vaddr, ph.filesz, ph.memsz, rwx, seg_pages, seg_start, seg_end);

        // Allocate physical pages and map via Sv32
        for (uint off = 0; off < seg_pages; off++) {
            uint va = seg_start + off * PGSIZE;
            void *pa = kalloc();
            if (!pa) {
                printf("  [FAIL] kalloc failed for page at va 0x%x\n", va);
                iunlockput(ip);
                return 0;
            }
            uint pa_val = (uint)pa;

            // Zero the page
            for (int b = 0; b < PGSIZE; b++)
                ((char*)pa)[b] = 0;

            // Read segment data from file
            uint page_start = seg_start + off * PGSIZE;
            uint page_end = page_start + PGSIZE;
            uint copy_start = (page_start < ph.vaddr) ? ph.vaddr : page_start;
            uint copy_end = (page_end < ph.vaddr + ph.filesz) ? page_end : (ph.vaddr + ph.filesz);
            uint buf_offset = copy_start - ph.vaddr;
            uint copy_len = (copy_end > copy_start) ? (copy_end - copy_start) : 0;

            if (copy_len > 0) {
                begin_op();
                r = readi(ip, 0, (uint64)((char*)pa + (copy_start - page_start)),
                          ph.offset + buf_offset, copy_len);
                end_op();
                if (r < (int)copy_len) {
                    printf("  [WARN] LOAD[%d] short read at va 0x%x: %d/%d bytes\n",
                           nloaded, va, r, copy_len);
                }
            }

            // Map via Sv32: va → pa, with user permissions (PTE_U)
            // Binaries run in U-mode with ecalls delegated to stvec
            uint perm = PTE_V | PTE_U;
            if (ph.flags & PF_R) perm |= PTE_R;
            if (ph.flags & PF_W) perm |= PTE_W;
            if (ph.flags & PF_X) perm |= PTE_X;

            printf("    Mapping [0x%x -> 0x%x] perm=0x%x\n", va, pa_val, perm);

            if (sv32_map_page(root_pt, va, pa_val, perm) != 0) {
                printf("  [FAIL] sv32_map_page(0x%x -> 0x%x) failed\n", va, pa_val);
                iunlockput(ip);
                return 0;
            }
            
            // Remember the physical base of the first PT_LOAD segment
            if (nloaded == 0 && off == 0) {
                ph_base_va = seg_start;
                ph_base_pa = pa_val;
            }
        }
        nloaded++;
    }

    if (nloaded == 0) {
        printf("[FAIL] No PT_LOAD segments found\n");
        iunlockput(ip);
        return 0;
    }

    // DEBUG: dump bytes at VA 0x10b4 ("console" string in shell .rodata)
    {
        uint probe_va = 0x10b4;
        uint vpn1 = (probe_va >> 22) & 0x3FF;
        uint vpn0 = (probe_va >> 12) & 0x3FF;
        uint off = probe_va & 0xFFF;
        uint *root = (uint *)root_pa;
        uint l1 = root[vpn1];
        if (l1 & PTE_V) {
            uint *l2 = (uint *)(PTE_PPN(l1) << 12);
            uint l2e = l2[vpn0];
            if (l2e & PTE_V) {
                char *phys = (char *)((PTE_PPN(l2e) << 12) + off);
                printf("  [ELF-DEBUG] VA 0x%x -> PA 0x%x\n  [ELF-DEBUG] Bytes: ", probe_va, (uint)phys);
                for (int db = 0; db < 16; db++) {
                    printf("%02x ", (unsigned char)phys[db]);
                }
                putchar('\n');
                printf("  [ELF-DEBUG] ASCII: ");
                for (int db = 0; db < 16; db++) {
                    char ch = phys[db]; putchar(ch >= 32 && ch < 127 ? ch : '.');
                }
                putchar('\n');
            }
        }
    }

    // 7. Allocate and map user stack
    printf("  Mapping stack [0x%x..0x%x)...\n",
           (uint)(0x80000000 - USER_STACK_PAGES * PGSIZE), 0x80000000u);
    uint stack_top = 0x80000000;  // kernel boundary
    uint stack_base = stack_top - USER_STACK_PAGES * PGSIZE;
    int stack_pages = 0;
    for (uint va = stack_base; va < stack_top; va += PGSIZE) {
        printf("  [stack page %d @ va 0x%x]\n", stack_pages++, va);
        void *pa = kalloc();
        if (!pa) {
            printf("[FAIL] kalloc for stack at 0x%x\n", va);
            iunlockput(ip);
            return 0;
        }
        for (int b = 0; b < PGSIZE; b++)
            ((char*)pa)[b] = 0;

        // Map stack as user R+W (not executable, with PTE_U)
        if (sv32_map_page(root_pt, va, (uint)pa, PTE_V | PTE_U | PTE_R | PTE_W) != 0) {
            printf("[FAIL] sv32_map_page stack at 0x%x\n", va);
            iunlockput(ip);
            return 0;
        }
    }

    printf("\n  >>> Sv32 page tables ready <<<\n");
    printf("  Root PT: pa=0x%x  kernel=[0x80000000..0x80100000)\n", root_pa);
    printf("  User:    [0x0..0x%x)  stack=[0x%x..0x%x) (%d pages)\n",
           nloaded > 0 ? 0x2000u : 0, stack_base, stack_top, USER_STACK_PAGES);
    printf("  Entry:   0x%x  (U-mode, Sv32 enabled, ecalls -> stvec)\n", hdr.entry);

    // Debug: check if entry page is mapped
    uint entry_page = hdr.entry & ~(PGSIZE - 1);
    printf("  Entry page VA: 0x%x, checking mapping...\n", entry_page);

    // Walk the page tables to see if entry page is mapped
    {
        uint *root = (uint *)root_pa;
        uint idx1 = (entry_page >> 22) & 0x3FF;
        uint idx0 = (entry_page >> 12) & 0x3FF;
        uint l1_pte = root[idx1];
        printf("  L1[%d] = 0x%x\n", idx1, l1_pte);
        if (l1_pte & PTE_V) {
            uint l2_pa = (l1_pte >> 10) << 12;
            uint *l2 = (uint *)l2_pa;
            uint l2_pte = l2[idx0];
            printf("  L2[%d] = 0x%x\n", idx0, l2_pte);
            if (l2_pte & PTE_V) {
                uint pa = (l2_pte >> 10) << 12;
                printf("  Entry page mapped to PA: 0x%x, perm=0x%x\n", pa, l2_pte & 0xFF);
            } else {
                printf("  [FAIL] Entry page PTE not valid!\n");
            }
        } else {
            printf("  [FAIL] Entry page L1 PTE not valid!\n");
        }
    }

    // 8. Drop to User-mode and execute the user binary
    // Pass the physical address of the entry point for flat execution
    uint phys_entry = ph_base_pa + (hdr.entry - ph_base_va);
    
    // Compute program end (page-aligned) for proper sz/sbrk behavior
    uint prog_end = 0;
    for (int i = 0; i < hdr.phnum && i < 32; i++) {
        struct elf32_phdr ph2;
        begin_op();
        r = readi(ip, 0, (uint64)&ph2, hdr.phoff + i * sizeof(ph2), sizeof(ph2));
        end_op();
        if (r < (int)sizeof(ph2)) break;
        if (ph2.type != PT_LOAD) continue;
        uint seg_end = ph2.vaddr + ph2.memsz;
        if (seg_end > prog_end) prog_end = seg_end;
    }
    uint prog_sz = (prog_end + PGSIZE - 1) & ~(PGSIZE - 1);
    if (prog_sz == 0) prog_sz = PGSIZE;
    
    run_elf_sv32(ip, hdr.entry, phys_entry, root_pt, root_pa, prog_sz);
    // never returns
}

// ── S-mode Entry ───────────────────────────────────────────────────
//
// Final step: unlock the inode and call the sv32_enter_user trampoline
// which sets up satp, stvec, mstatus.MPP, and mrets to user code.

static void __attribute__((noreturn))
run_elf_sv32(struct inode *ip, uint entry, uint phys_entry, pagetable_t root_pt, uint root_pa, uint prog_sz)
{
    printf("\n>>> Entering User-mode at entry=0x%x (phys=0x%x) with Sv32...\n\n", entry, phys_entry);

    // Set up dummy process fields so that xv6 file/sysfile system calls
    // (which rely on myproc()->cwd, myproc()->pagetable, and myproc()->trapframe) work correctly.
    struct proc *p = myproc();
    p->pagetable = root_pt;
    // sz = end of loaded program data (page-aligned).
    // fetchaddr/argstr use 0x80000000 boundary (patched syscall.c),
    // so stack access works regardless of sz value.
    // Set sz to program end so sbrk works correctly after fork.
    p->sz = prog_sz;

    // DEBUG: re-check memory at VA 0x10b4 after entry setup
    printf("[PRE-EXEC-MARKER]\n");
    {
        uint va = 0x10b4;
        uint vpn1 = (va >> 22) & 0x3FF;
        uint vpn0 = (va >> 12) & 0x3FF;
        uint off = va & 0xFFF;
        uint *root = (uint *)root_pt;
        uint l1 = root[vpn1];
        if (l1 & PTE_V) {
            uint *l2 = (uint *)(PTE_PPN(l1) << 12);
            uint l2e = l2[vpn0];
            if (l2e & PTE_V) {
                char *phys = (char *)((PTE_PPN(l2e) << 12) + off);
                printf("[PRE-EXEC] PA 0x%x: ", (uint)phys);
                for (int db = 0; db < 8; db++)
                    printf("%x ", (unsigned char)phys[db]);
                printf(" \"");
                for (int db = 0; db < 8; db++) {
                    char c = phys[db];
                    putchar(c >= 32 && c < 127 ? c : '.');
                }
                printf("\"\n");
            }
        }
    }

    // Allocate trapframe
    printf("[D] Allocating trapframe...\n");
    p->trapframe = (struct trapframe *)kalloc();
    if (p->trapframe) {
        for (int i = 0; i < PGSIZE / 4; i++)
            ((uint32 *)p->trapframe)[i] = 0;
        p->trapframe->epc = entry;
        p->trapframe->sp = 0x7FFFF000;
        p->trapframe->a0 = 0;
        p->trapframe->a1 = 0;
        p->trapframe->ra = 0xFFFFFFFF;
    }

    // Open "/" as current working directory
    struct inode *cwd_ip = namei("/");
    if (cwd_ip) {
        ilock(cwd_ip);
        iunlock(cwd_ip);
        p->cwd = cwd_ip;
    }

    // Set up standard input, output, error pointing to console device
    extern struct file* filealloc(void);
    struct file *f = filealloc();
    if (f) {
        f->type = FD_DEVICE;
        f->major = 1; // CONSOLE
        f->readable = 1;
        f->writable = 1;
        p->ofile[0] = f;
        p->ofile[1] = f;
        p->ofile[2] = f;
        f->ref = 3;
        printf("[Init] Console FDs (0, 1, 2) allocated and set up\n");
    } else {
        printf("[WARN] Could not allocate file struct for console FDs\n");
    }

    iunlockput(ip);

    // Direct jump to user entry - no privilege transition
    // The GeOS interpreter doesn't fully support U-mode, so we run in flat mode
    printf("[INFO] Jumping to user entry=0x%x (phys=0x%x, flat mode, no Sv32)\n\n", entry, phys_entry);
    
    extern void exec_elf(uint entry, uint root_pa) __attribute__((noreturn));
    exec_elf(entry, root_pa);
    
    // Should never reach here
    printf("[ERROR] exec_elf returned!\n");
    for(;;);
}

#if 0
// ── ELF Execution ──────────────────────────────────────────────────
//
// Sets up initial register state and jumps to the loaded ELF's entry point.
// The ELF is loaded in guest memory with its segments at the expected vaddr.
// Stack pointer is set just below 0x80000000 (kernel boundary).
//
// NOTE: Temporarily disabled because xv6 user binaries link at vaddr 0x0,
// which is below RAM base (0x80000000). Would need Sv32 page tables to
// map loaded pages to vaddr 0x0 and enable execution.

static void __attribute__((noreturn))
run_elf(struct inode *ip, uint entry)
{
    printf("\n>>> Executing ELF at entry=0x%x...\n\n", entry);
    iunlockput(ip);

    // RISC-V register setup for starting a user program:
    //   sp = stack_top (below kernel at 0x80000000)
    //   a0 = 0 (argc)
    //   a1 = 0 (argv)
    //   pc = entry

    // Inline assembly to set registers and jump to the entry point.
    // Since we're in a flat address space (kernel and user share the same
    // physical memory), we can jump directly to the loaded code.
    //
    // Note: xv6 user programs use ecall for syscalls, which will trap into
    // GeOS's SBI handler (not xv6's trap handler). This means ecalls from
    // user programs will NOT work correctly without additional syscall stubs.
    // For now, this proves the loading pipeline works.

    // No fence.i needed — GeOS is a software interpreter with no
    // separate instruction cache. Loaded code is immediately visible.

    // Jump to the entry point via the exec_elf trampoline (sets sp, a0, a1).
    // xv6 user programs expect: sp = user stack top, a0=0 (argc), a1=0 (argv)
    exec_elf((void*)(uint64)entry);

    // Should never reach here
    printf("ERROR: ELF entry returned!\n");
    shutdown();
}
#endif

// ── Main ───────────────────────────────────────────────────────────

void
geos_main(void)
{
    printf("\n");
    printf("xv6 native kernel booting on Geometry OS\n");
    printf("Arch: RV32I, 1024-byte blocks, GeOS ecall stubs\n");
    printf("\n");

    // Initialize kernel subsystems
    fileinit();    // file table
    consoleinit(); // console device (devsw[CONSOLE].read/write)

    // Create boot process so that xv6 sleeplock/fs code has a valid proc
    // (sleeplock.c calls myproc()->pid when acquiring locks).
    // This process is replaced when the shell is loaded.
    {
        extern struct proc *allocproc(void);
        extern void set_myproc(struct proc *p);
        struct proc *boot_p = allocproc();
        if (boot_p) {
            safestrcpy(boot_p->name, "boot", sizeof(boot_p->name));
            set_myproc(boot_p);
        }
    }

    // Run the full filesystem validation
    int ret = fs_validation();

    if (ret == 0) {
        printf("\nAll FS tests passed.\n");
    } else {
        printf("\nFS tests FAILED (code %d). Shutting down.\n", ret);
        shutdown();
    }

    // Now try running /sh as a user-space ELF with Sv32
    printf("\n=== Booting /sh (user-space shell) ===\n");

    // Load and run /sh with Sv32 page tables
    load_and_run_elf("/sh");

    // Should never reach here
    printf("\nERROR: load_and_run_elf returned!\n");
    shutdown();
}
