/*
 * net_syscall_test.c -- Networking syscall test for GeOS RISC-V user-mode.
 *
 * Tests: socket, connect, sendto, recvfrom, shutdown, close
 * via raw Linux user-mode syscalls (no libc).
 *
 * Build: ./build.sh net_syscall_test.c net_syscall_test.elf
 * Run:   geometry_os --cli --user examples/riscv-hello/net_syscall_test.elf
 */

#include <stdint.h>

/* RISC-V Linux asm-generic syscall numbers */
#define SYS_write     64
#define SYS_exit      93
#define SYS_exit_group 94
#define SYS_close     57
#define SYS_socket    198
#define SYS_connect   203
#define SYS_sendto    206
#define SYS_recvfrom  207
#define SYS_shutdown  210

/* Raw syscall wrappers -- a7=syscall number, a0-a5=args, return a0 */
static inline long syscall0(long nr) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0");
    __asm__ volatile("ecall" : "=r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static inline long syscall1(long nr, long a0) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    __asm__ volatile("ecall" : "+r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static inline long syscall2(long nr, long a0, long a1) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    __asm__ volatile("ecall"
        : "+r"(_a0)
        : "r"(a1_), "r"(a7)
        : "memory");
    return _a0;
}

static inline long syscall3(long nr, long a0, long a1, long a2) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    register long a2_ __asm__("a2") = a2;
    __asm__ volatile("ecall"
        : "+r"(_a0)
        : "r"(a1_), "r"(a2_), "r"(a7)
        : "memory");
    return _a0;
}

static inline long syscall6(long nr, long a0, long a1, long a2, long a3, long a4, long a5) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    register long a2_ __asm__("a2") = a2;
    register long a3_ __asm__("a3") = a3;
    register long a4_ __asm__("a4") = a4;
    register long a5_ __asm__("a5") = a5;
    __asm__ volatile("ecall"
        : "+r"(_a0)
        : "r"(a1_), "r"(a2_), "r"(a3_), "r"(a4_), "r"(a5_), "r"(a7)
        : "memory");
    return _a0;
}

/* Utility functions */
static int slen(const char *s) {
    int n = 0;
    while (s[n]) n++;
    return n;
}

static void puts(const char *s) {
    syscall3(SYS_write, 1, (long)s, slen(s));
}

static void putn(long val) {
    if (val < 0) { puts("-"); val = -val; }
    if (val == 0) { puts("0"); return; }
    char buf[20];
    int i = 0;
    while (val > 0) {
        buf[i++] = '0' + (val % 10);
        val /= 10;
    }
    char out[20];
    for (int j = 0; j < i; j++) out[j] = buf[i - 1 - j];
    out[i] = 0;
    puts(out);
}

static void put_hex(long val) {
    const char hex[] = "0123456789ABCDEF";
    char buf[11];
    buf[0] = '0'; buf[1] = 'x';
    for (int i = 0; i < 8; i++) {
        buf[2 + i] = hex[(val >> (28 - i * 4)) & 0xF];
    }
    buf[10] = 0;
    puts(buf);
}

/* Test tracking */
static int passed = 0;
static int total = 0;

static void check(const char *name, long actual, long expected) {
    total++;
    if (actual == expected) {
        puts("  PASS: "); puts(name); puts("\n");
        passed++;
    } else {
        puts("  FAIL: "); puts(name);
        puts(" expected="); put_hex(expected);
        puts(" actual="); put_hex(actual);
        puts("\n");
    }
}

static void check_nonneg(const char *name, long val) {
    total++;
    if (val >= 0) {
        puts("  PASS: "); puts(name); puts(" = "); put_hex(val); puts("\n");
        passed++;
    } else {
        puts("  FAIL: "); puts(name); puts(" = "); put_hex(val); puts(" (negative)\n");
    }
}

static void check_ok(const char *name, long val, long alt_ok) {
    total++;
    if (val == 0 || val == alt_ok) {
        puts("  PASS: "); puts(name); puts(" = "); put_hex(val); puts("\n");
        passed++;
    } else {
        puts("  FAIL: "); puts(name); puts(" = "); put_hex(val); puts("\n");
    }
}

/* sockaddr_in layout for AF_INET, manually constructed (no libc) */
struct addr_in {
    uint16_t family;   /* AF_INET = 2 */
    uint16_t port;     /* big-endian (network byte order) */
    uint32_t addr;     /* 127.0.0.1 in network byte order */
    uint8_t  zero[8];  /* padding */
};

/* Entry point */
void c_start(void) {
    puts("\n=== Networking Syscall Test ===\n");

    /* Test 1: socket(AF_INET, SOCK_STREAM, 0) */
    puts("\n--- socket() ---\n");
    long fd = syscall3(SYS_socket, 2, 1, 0);
    check_nonneg("socket(AF_INET, SOCK_STREAM, 0)", fd);

    if (fd < 0) {
        puts("\nSocket creation failed, skipping remaining tests.\n");
        puts("\nSummary: "); putn(passed); puts("/"); putn(total); puts(" passed\n");
        syscall1(SYS_exit, 1);
        __builtin_unreachable();
    }

    /* Test 2: connect(fd, 127.0.0.1:80) */
    puts("\n--- connect() ---\n");
    struct addr_in addr;
    addr.family = 2;
    addr.port = (80 << 8) & 0xFF00;  /* htons(80) = 0x5000 */
    addr.addr = 0x0100007F;          /* 127.0.0.1 in network byte order */
    for (int i = 0; i < 8; i++) addr.zero[i] = 0;

    long conn_ret = syscall3(SYS_connect, fd, (long)&addr, sizeof(addr));
    /* 0 = connected, -111 = ECONNREFUSED (no server), both acceptable */
    check_ok("connect(127.0.0.1:80)", conn_ret, -111);

    if (conn_ret == 0) {
        /* Test 3: sendto -- send HTTP GET */
        puts("\n--- sendto() ---\n");
        const char req[] = "GET / HTTP/1.0\r\nHost: 127.0.0.1\r\n\r\n";
        long send_ret = syscall6(SYS_sendto, fd, (long)req, sizeof(req) - 1, 0, 0, 0);
        check_nonneg("sendto(HTTP GET)", send_ret);

        if (send_ret > 0) {
            /* Test 4: recvfrom -- read response */
            puts("\n--- recvfrom() ---\n");
            volatile char buf[256];
            for (int i = 0; i < 256; i++) buf[i] = 0;

            long recv_ret = syscall6(SYS_recvfrom, fd, (long)buf, 255, 0, 0, 0);
            check_nonneg("recvfrom()", recv_ret);

            if (recv_ret > 0) {
                puts("\n--- Response (first 128 bytes) ---\n");
                int show = recv_ret > 128 ? 128 : (int)recv_ret;
                /* Write response directly via SYS_write to avoid null issues */
                syscall3(SYS_write, 1, (long)buf, show);
                puts("\n");
            }
        }
    } else {
        puts("  (skipping sendto/recvfrom -- not connected)\n");
    }

    /* Test 5: shutdown */
    puts("\n--- shutdown() ---\n");
    long shut_ret = syscall2(SYS_shutdown, fd, 2);
    check("shutdown(fd, SHUT_RDWR)", shut_ret, 0);

    /* Test 6: close */
    puts("\n--- close() ---\n");
    long close_ret = syscall1(SYS_close, fd);
    check("close(fd)", close_ret, 0);

    /* Summary */
    puts("\n=== Summary: ");
    putn(passed);
    puts("/");
    putn(total);
    puts(" passed ===\n\n");

    syscall1(SYS_exit, (total - passed) > 0 ? 1 : 0);
    __builtin_unreachable();
}
