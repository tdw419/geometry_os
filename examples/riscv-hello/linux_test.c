/*
 * linux_test.c -- Multi-syscall test for GeOS RISC-V Linux user-mode emulation.
 * Compile: riscv64-linux-gnu-gcc -static -march=rv32ima -mabi=ilp32 -nostdlib -ffreestanding -o linux_test.elf linux_test.c
 */

typedef struct {
    long tv_sec;
    long tv_nsec;
} timespec_t;

typedef struct {
    char sysname[65];
    char nodename[65];
    char release[65];
    char version[65];
    char machine[65];
} utsname_t;

static long syscall1(long nr, long a0) {
    register long a7 asm("a7") = nr;
    register long _a0 asm("a0") = a0;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static long syscall3(long nr, long a0, long a1, long a2) {
    register long a7 asm("a7") = nr;
    register long _a0 asm("a0") = a0;
    register long _a1 asm("a1") = a1;
    register long _a2 asm("a2") = a2;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7), "r"(_a1), "r"(_a2) : "memory");
    return _a0;
}

static long syscall2(long nr, long a0, long a1) {
    register long a7 asm("a7") = nr;
    register long _a0 asm("a0") = a0;
    register long _a1 asm("a1") = a1;
    asm volatile("ecall" : "+r"(_a0) : "r"(a7), "r"(_a1) : "memory");
    return _a0;
}

static int strlen_local(const char *s) {
    int n = 0;
    while (s[n]) n++;
    return n;
}

static void print(const char *s) {
    syscall3(64, 1, (long)s, strlen_local(s));
}

static void print_num(unsigned int n) {
    char buf[12];
    int i = 0;
    if (n == 0) { syscall3(64, 1, (long)"0", 1); return; }
    while (n > 0) { buf[i++] = '0' + (n % 10); n /= 10; }
    char out[12];
    for (int j = 0; j < i; j++) out[j] = buf[i - 1 - j];
    syscall3(64, 1, (long)out, i);
}

void _start(void) {
    print("=== GeOS Linux User-Mode Test ===\n");

    /* 1. write (64) */
    print("1. write:      OK\n");

    /* 2. getpid (170) */
    long pid = syscall1(170, 0);
    print("2. getpid:     ");
    print_num(pid);
    print("\n");

    /* 3. getuid (172) */
    long uid = syscall1(172, 0);
    print("3. getuid:     ");
    print_num(uid);
    print("\n");

    /* 4. getgid (174) */
    long gid = syscall1(174, 0);
    print("4. getgid:     ");
    print_num(gid);
    print("\n");

    /* 5. brk (214) */
    long brk0 = syscall1(214, 0);
    print("5. brk:        0x");
    print_num(brk0);
    print(" -> 0x");
    long brk1 = syscall1(214, brk0 + 4096);
    print_num(brk1);
    print("\n");

    /* 6. uname (160) */
    utsname_t uname_buf;
    for (int i = 0; i < (int)sizeof(utsname_t); i++) ((volatile char*)&uname_buf)[i] = 0;
    long ur = syscall2(160, 0, (long)&uname_buf);
    print("6. uname:      ");
    if (ur == 0) {
        print(uname_buf.sysname);
        print(" ");
        print(uname_buf.release);
    } else {
        print("ERR ");
        print_num(ur);
    }
    print("\n");

    /* 7. clock_gettime (111, CLOCK_REALTIME=0) */
    timespec_t ts;
    long ctr = syscall3(111, 0, (long)&ts, 0);
    print("7. clock:      ");
    if (ctr == 0) {
        print("sec=");
        print_num(ts.tv_sec);
    } else {
        print("ERR ");
        print_num(ctr);
    }
    print("\n");

    /* 8. getrandom (278) */
    unsigned int rng = 0;
    long grr = syscall3(278, (long)&rng, 4, 0);
    print("8. getrandom:  ");
    if (grr == 4) {
        print("OK val=");
        print_num(rng & 0x7FFFFFFF);
    } else {
        print("ERR ");
        print_num(grr);
    }
    print("\n");

    /* 9. mmap (220) */
    long mp = syscall3(220, 0, 4096, 3);
    print("9. mmap:       0x");
    print_num(mp);
    print("\n");

    print("=== All tests complete ===\n");

    /* exit_group(0) */
    syscall1(94, 0);
    __builtin_unreachable();
}
