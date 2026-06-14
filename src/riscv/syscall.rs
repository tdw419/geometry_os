// riscv/syscall.rs -- Linux RISC-V syscall number-to-name decoder (Phase 41)
//
// Maps Linux RISC-V syscall numbers to their names.
// On RISC-V Linux, the syscall number is passed in a7 (x17),
// arguments in a0-a5 (x10-x15), and the return value comes back in a0.
//
// Reference: Linux kernel arch/r86/kernel/syscalls/syscall.tbl
// RISC-V uses the same numbers as the generic syscall table (asm-generic/unistd.h).

/// A recorded Linux syscall event.
#[derive(Debug, Clone)]
pub struct SyscallEvent {
    /// Syscall number (from a7/x17).
    pub nr: u32,
    /// Syscall name (looked up from table, "unknown" if unmapped).
    pub name: &'static str,
    /// Arguments: a0-a5 (x10-x15).
    pub args: [u32; 6],
    /// Return value (a0 after kernel returns).
    /// None if we haven't observed the return yet.
    pub ret: Option<u32>,
    /// PC where the ECALL was executed.
    pub pc: u32,
}

/// Decode a Linux RISC-V syscall number to its name.
/// Returns "unknown" for unmapped numbers.
pub fn syscall_name(nr: u32) -> &'static str {
    SYSCALL_TABLE
        .get(nr as usize)
        .copied()
        .flatten()
        .unwrap_or("unknown")
}

/// Total number of syscalls in the table.
pub fn syscall_count() -> usize {
    SYSCALL_TABLE.len()
}

// Complete Linux RISC-V syscall table (asm-generic/unistd.h).
// Covers syscalls 0-468 as defined in Linux 6.x.
// Stored as a flat array for O(1) lookup.
static SYSCALL_TABLE: &[Option<&str>] = &[
    // 0-9
    Some("io_setup"),     // 0
    Some("io_destroy"),   // 1
    Some("io_submit"),    // 2
    Some("io_cancel"),    // 3
    Some("io_getevents"), // 4
    Some("setxattr"),     // 5
    Some("lsetxattr"),    // 6
    Some("fsetxattr"),    // 7
    Some("getxattr"),     // 8
    Some("lgetxattr"),    // 9
    // 10-19
    Some("fgetxattr"),      // 10
    Some("listxattr"),      // 11
    Some("llistxattr"),     // 12
    Some("flistxattr"),     // 13
    Some("removexattr"),    // 14
    Some("lremovexattr"),   // 15
    Some("fremovexattr"),   // 16
    Some("getcwd"),         // 17
    Some("lookup_dcookie"), // 18
    Some("eventfd2"),       // 19
    // 20-29
    Some("epoll_create1"),     // 20
    Some("epoll_ctl"),         // 21
    Some("epoll_pwait"),       // 22
    Some("dup"),               // 23
    Some("dup3"),              // 24
    Some("fcntl"),             // 25
    Some("inotify_init1"),     // 26
    Some("inotify_add_watch"), // 27
    Some("inotify_rm_watch"),  // 28
    Some("ioctl"),             // 29
    // 30-39
    Some("ioprio_set"), // 30
    Some("ioprio_get"), // 31
    Some("flock"),      // 32
    Some("mknodat"),    // 33
    Some("mkdirat"),    // 34
    Some("unlinkat"),   // 35
    Some("symlinkat"),  // 36
    Some("linkat"),     // 37
    Some("renameat"),   // 38
    Some("umount2"),    // 39
    // 40-49
    Some("mount"),      // 40
    Some("pivot_root"), // 41
    Some("nfsservctl"), // 42
    Some("statfs"),     // 43
    Some("fstatfs"),    // 44
    Some("truncate"),   // 45
    Some("ftruncate"),  // 46
    Some("fallocate"),  // 47
    Some("faccessat"),  // 48
    Some("chdir"),      // 49
    // 50-59
    Some("fchdir"),   // 50
    Some("chroot"),   // 51
    Some("fchmod"),   // 52
    Some("fchmodat"), // 53
    Some("fchownat"), // 54
    Some("fchown"),   // 55
    Some("openat"),   // 56
    Some("close"),    // 57
    Some("vhangup"),  // 58
    Some("pipe2"),    // 59
    // 60-69
    Some("quotactl"),   // 60
    Some("getdents64"), // 61
    Some("lseek"),      // 62
    Some("read"),       // 63
    Some("write"),      // 64
    Some("readv"),      // 65
    Some("writev"),     // 66
    Some("pread64"),    // 67
    Some("pwrite64"),   // 68
    Some("preadv"),     // 69
    // 70-79
    Some("pwritev"),    // 70
    Some("sendfile"),   // 71
    Some("pselect6"),   // 72
    Some("ppoll"),      // 73
    Some("signalfd4"),  // 74
    Some("vmsplice"),   // 75
    Some("splice"),     // 76
    Some("tee"),        // 77
    Some("readlinkat"), // 78
    Some("fstatat"),    // 79
    // 80-89
    Some("fstat"),           // 80
    Some("sync"),            // 81
    Some("fsync"),           // 82
    Some("fdatasync"),       // 83
    Some("sync_file_range"), // 84
    Some("timerfd_create"),  // 85
    Some("timerfd_settime"), // 86
    Some("timerfd_gettime"), // 87
    Some("utimensat"),       // 88
    Some("acct"),            // 89
    // 90-99
    Some("capget"),          // 90
    Some("capset"),          // 91
    Some("personality"),     // 92
    Some("exit"),            // 93
    Some("exit_group"),      // 94
    Some("waitid"),          // 95
    Some("set_tid_address"), // 96
    Some("unshare"),         // 97
    Some("futex"),           // 98
    Some("set_robust_list"), // 99
    // 100-109
    Some("get_robust_list"),  // 100
    Some("nanosleep"),        // 101
    Some("getitimer"),        // 102
    Some("setitimer"),        // 103
    Some("kexec_load"),       // 104
    Some("init_module"),      // 105
    Some("delete_module"),    // 106
    Some("timer_create"),     // 107
    Some("timer_gettime"),    // 108
    Some("timer_getoverrun"), // 109
    // 110-119
    Some("timer_settime"),      // 110
    Some("timer_delete"),       // 111
    Some("clock_settime"),      // 112
    Some("clock_gettime"),      // 113
    Some("clock_getres"),       // 114
    Some("clock_nanosleep"),    // 115
    Some("syslog"),             // 116
    Some("ptrace"),             // 117
    Some("sched_setparam"),     // 118
    Some("sched_setscheduler"), // 119
    // 120-129
    Some("sched_getscheduler"),     // 120
    Some("sched_getparam"),         // 121
    Some("sched_setaffinity"),      // 122
    Some("sched_getaffinity"),      // 123
    Some("sched_yield"),            // 124
    Some("sched_get_priority_max"), // 125
    Some("sched_get_priority_min"), // 126
    Some("sched_rr_get_interval"),  // 127
    Some("restart_syscall"),        // 128
    Some("kill"),                   // 129
    // 130-139
    Some("tkill"),           // 130
    Some("tgkill"),          // 131
    Some("sigaltstack"),     // 132
    Some("rt_sigsuspend"),   // 133
    Some("rt_sigaction"),    // 134
    Some("rt_sigprocmask"),  // 135
    Some("rt_sigpending"),   // 136
    Some("rt_sigtimedwait"), // 137
    Some("rt_sigqueueinfo"), // 138
    Some("rt_sigreturn"),    // 139
    // 140-149
    Some("setpriority"), // 140
    Some("getpriority"), // 141
    Some("reboot"),      // 142
    Some("setregid"),    // 143
    Some("setgid"),      // 144
    Some("setreuid"),    // 145
    Some("setuid"),      // 146
    Some("setresuid"),   // 147
    Some("getresuid"),   // 148
    Some("setresgid"),   // 149
    // 150-159
    Some("getresgid"), // 150
    Some("setfsuid"),  // 151
    Some("setfsgid"),  // 152
    Some("times"),     // 153
    Some("setpgid"),   // 154
    Some("getpgid"),   // 155
    Some("getsid"),    // 156
    Some("setsid"),    // 157
    Some("getgroups"), // 158
    Some("setgroups"), // 159
    // 160-169
    Some("uname"),         // 160
    Some("sethostname"),   // 161
    Some("setdomainname"), // 162
    Some("getrlimit"),     // 163
    Some("setrlimit"),     // 164
    Some("getrusage"),     // 165
    Some("umask"),         // 166
    Some("prctl"),         // 167
    Some("getcpu"),        // 168
    Some("gettimeofday"),  // 169
    // 170-179
    Some("settimeofday"), // 170
    Some("adjtimex"),     // 171
    Some("getpid"),       // 172
    Some("getppid"),      // 173
    Some("getuid"),       // 174
    Some("geteuid"),      // 175
    Some("getgid"),       // 176
    Some("getegid"),      // 177
    Some("gettid"),       // 178
    Some("sysinfo"),      // 179
    // 180-189
    Some("mq_open"),         // 180
    Some("mq_unlink"),       // 181
    Some("mq_timedsend"),    // 182
    Some("mq_timedreceive"), // 183
    Some("mq_notify"),       // 184
    Some("mq_getsetattr"),   // 185
    Some("msgget"),          // 186
    Some("msgctl"),          // 187
    Some("msgrcv"),          // 188
    Some("msgsnd"),          // 189
    // 190-199
    Some("semget"),     // 190
    Some("semctl"),     // 191
    Some("semtimedop"), // 192
    Some("semop"),      // 193
    Some("shmget"),     // 194
    Some("shmctl"),     // 195
    Some("shmat"),      // 196
    Some("shmdt"),      // 197
    Some("socket"),     // 198
    Some("socketpair"), // 199
    // 200-209
    Some("bind"),        // 200
    Some("listen"),      // 201
    Some("accept"),      // 202
    Some("connect"),     // 203
    Some("getsockname"), // 204
    Some("getpeername"), // 205
    Some("sendto"),      // 206
    Some("recvfrom"),    // 207
    Some("setsockopt"),  // 208
    Some("getsockopt"),  // 209
    // 210-219
    Some("shutdown"),    // 210
    Some("sendmsg"),     // 211
    Some("recvmsg"),     // 212
    Some("readahead"),   // 213
    Some("brk"),         // 214
    Some("munmap"),      // 215
    Some("mremap"),      // 216
    Some("add_key"),     // 217
    Some("request_key"), // 218
    Some("keyctl"),      // 219
    // 220-229
    Some("clone"),     // 220
    Some("execve"),    // 221
    Some("mmap"),      // 222
    Some("fadvise64"), // 223
    Some("swapon"),    // 224
    Some("swapoff"),   // 225
    Some("mprotect"),  // 226
    Some("msync"),     // 227
    Some("mlock"),     // 228
    Some("munlock"),   // 229
    // 230-239
    Some("mlockall"),         // 230
    Some("munlockall"),       // 231
    Some("mincore"),          // 232
    Some("madvise"),          // 233
    Some("remap_file_pages"), // 234
    Some("mbind"),            // 235
    Some("get_mempolicy"),    // 236
    Some("set_mempolicy"),    // 237
    Some("migrate_pages"),    // 238
    Some("move_pages"),       // 239
    // 240-249
    Some("rt_tgsigqueueinfo"), // 240
    Some("perf_event_open"),   // 241
    Some("accept4"),           // 242
    Some("recvmmsg"),          // 243
    Some("arch_specific"),     // 244
    None,                      // 245
    None,                      // 246
    None,                      // 247
    None,                      // 248
    None,                      // 249
    // 250-259
    None, // 250
    None, // 251
    None, // 252
    None, // 253
    None, // 254
    None, // 255
    None, // 256
    None, // 257
    None, // 258
    None, // 259
    // 260-269
    Some("wait4"),             // 260
    Some("prlimit64"),         // 261
    Some("fanotify_init"),     // 262
    Some("fanotify_mark"),     // 263
    Some("name_to_handle_at"), // 264
    Some("open_by_handle_at"), // 265
    Some("clock_adjtime"),     // 266
    Some("syncfs"),            // 267
    Some("setns"),             // 268
    Some("sendmmsg"),          // 269
    // 270-279
    Some("process_vm_readv"),  // 270
    Some("process_vm_writev"), // 271
    Some("kcmp"),              // 272
    Some("finit_module"),      // 273
    Some("sched_setattr"),     // 274
    Some("sched_getattr"),     // 275
    Some("renameat2"),         // 276
    Some("seccomp"),           // 277
    Some("getrandom"),         // 278
    Some("memfd_create"),      // 279
    // 280-289
    Some("bpf"),             // 280
    Some("execveat"),        // 281
    Some("userfaultfd"),     // 282
    Some("membarrier"),      // 283
    Some("mlock2"),          // 284
    Some("copy_file_range"), // 285
    Some("preadv2"),         // 286
    Some("pwritev2"),        // 287
    Some("pkey_mprotect"),   // 288
    Some("pkey_alloc"),      // 289
    // 290-299
    Some("pkey_free"),       // 290
    Some("statx"),           // 291
    Some("io_pgetevents"),   // 292
    Some("rseq"),            // 293
    Some("kexec_file_load"), // 294
    None,                    // 295
    None,                    // 296
    None,                    // 297
    None,                    // 298
    None,                    // 299
    // 300-309
    None, // 300
    None, // 301
    None, // 302
    None, // 303
    None, // 304
    None, // 305
    None, // 306
    None, // 307
    None, // 308
    None, // 309
    // 310-319
    None, // 310
    None, // 311
    None, // 312
    None, // 313
    None, // 314
    None, // 315
    None, // 316
    None, // 317
    None, // 318
    None, // 319
    // 320-329
    None, // 320
    None, // 321
    None, // 322
    None, // 323
    None, // 324
    None, // 325
    None, // 326
    None, // 327
    None, // 328
    None, // 329
    // 330-339
    None, // 330
    None, // 331
    None, // 332
    None, // 333
    None, // 334
    None, // 335
    None, // 336
    None, // 337
    None, // 338
    None, // 339
    // 340-349
    None, // 340
    None, // 341
    None, // 342
    None, // 343
    None, // 344
    None, // 345
    None, // 346
    None, // 347
    None, // 348
    None, // 349
    // 350-359
    None, // 350
    None, // 351
    None, // 352
    None, // 353
    None, // 354
    None, // 355
    None, // 356
    None, // 357
    None, // 358
    None, // 359
    // 360-369
    None, // 360
    None, // 361
    None, // 362
    None, // 363
    None, // 364
    None, // 365
    None, // 366
    None, // 367
    None, // 368
    None, // 369
    // 370-379
    None, // 370
    None, // 371
    None, // 372
    None, // 373
    None, // 374
    None, // 375
    None, // 376
    None, // 377
    None, // 378
    None, // 379
    // 380-389
    None, // 380
    None, // 381
    None, // 382
    None, // 383
    None, // 384
    None, // 385
    None, // 386
    None, // 387
    None, // 388
    None, // 389
    // 390-399
    None, // 390
    None, // 391
    None, // 392
    None, // 393
    None, // 394
    None, // 395
    None, // 396
    None, // 397
    None, // 398
    None, // 399
    // 400-409
    None,                    // 400
    None,                    // 401
    None,                    // 402
    Some("clock_gettime64"), // 403
    Some("clock_settime64"), // 404
    None,                    // 405
    None,                    // 406
    None,                    // 407
    None,                    // 408
    None,                    // 409
    // 410-419
    None, // 410
    None, // 411
    None, // 412
    None, // 413
    None, // 414
    None, // 415
    None, // 416
    None, // 417
    None, // 418
    None, // 419
    // 420-429
    None,                      // 420
    None,                      // 421
    None,                      // 422
    None,                      // 423
    Some("pidfd_send_signal"), // 424
    Some("io_uring_setup"),    // 425
    Some("io_uring_enter"),    // 426
    Some("io_uring_register"), // 427
    Some("open_tree"),         // 428
    Some("move_mount"),        // 429
    // 430-439
    Some("fsopen"),      // 430
    Some("fsconfig"),    // 431
    Some("fsmount"),     // 432
    Some("fspick"),      // 433
    Some("pidfd_open"),  // 434
    Some("clone3"),      // 435
    Some("close_range"), // 436
    Some("openat2"),     // 437
    Some("pidfd_getfd"), // 438
    Some("faccessat2"),  // 439
    // 440-449
    Some("process_madvise"),         // 440
    Some("epoll_pwait2"),            // 441
    Some("mount_setattr"),           // 442
    Some("quotactl_fd"),             // 443
    Some("landlock_create_ruleset"), // 444
    Some("landlock_add_rule"),       // 445
    Some("landlock_restrict_self"),  // 446
    Some("memfd_secret"),            // 447
    Some("process_mrelease"),        // 448
    Some("futex_waitv"),             // 449
    // 450-459
    Some("set_mempolicy_home_node"), // 450
    Some("cachestat"),               // 451
    Some("fchmodat2"),               // 452
    Some("map_shadow_stack"),        // 453
    Some("futex_wake"),              // 454
    Some("futex_wait"),              // 455
    Some("futex_requeue"),           // 456
    Some("statmount"),               // 457
    Some("listmount"),               // 458
    Some("lsm_get_self_attr"),       // 459
    // 460-469
    Some("lsm_set_self_attr"), // 460
    Some("lsm_list_modules"),  // 461
    Some("mseal"),             // 462
    Some("setxattrat"),        // 463
    Some("getxattrat"),        // 464
    Some("listxattrat"),       // 465
    Some("removexattrat"),     // 466
    Some("open_tree_attr"),    // 467
    Some("file_getattr"),      // 468
];

impl std::fmt::Display for SyscallEvent {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let args_str = self
            .args
            .iter()
            .map(|a| format!("0x{:08X}", a))
            .collect::<Vec<_>>()
            .join(", ");
        match self.ret {
            Some(r) => write!(
                f,
                "{}({}) = 0x{:08X}  [pc=0x{:08X}, nr={}]",
                self.name, args_str, r, self.pc, self.nr
            ),
            None => write!(
                f,
                "{}({}) [pending]  [pc=0x{:08X}, nr={}]",
                self.name, args_str, self.pc, self.nr
            ),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_known_syscalls() {
        assert_eq!(syscall_name(56), "openat");
        assert_eq!(syscall_name(57), "close");
        assert_eq!(syscall_name(63), "read");
        assert_eq!(syscall_name(64), "write");
        assert_eq!(syscall_name(93), "exit");
        assert_eq!(syscall_name(94), "exit_group");
        assert_eq!(syscall_name(172), "getpid");
        assert_eq!(syscall_name(174), "getuid");
        assert_eq!(syscall_name(214), "brk");
        assert_eq!(syscall_name(222), "mmap");
        assert_eq!(syscall_name(220), "clone");
        assert_eq!(syscall_name(221), "execve");
        assert_eq!(syscall_name(98), "futex");
        assert_eq!(syscall_name(162), "setdomainname");
        assert_eq!(syscall_name(172), "getpid");
        assert_eq!(syscall_name(180), "mq_open");
        assert_eq!(syscall_name(278), "getrandom");
        assert_eq!(syscall_name(291), "statx");
    }

    #[test]
    fn test_unknown_syscall() {
        assert_eq!(syscall_name(9999), "unknown");
        assert_eq!(syscall_name(500), "unknown");
    }

    #[test]
    fn test_table_size() {
        // We should have entries covering the main syscall range (0-468).
        let known = SYSCALL_TABLE.iter().filter(|e| e.is_some()).count();
        assert!(
            known >= 300,
            "expected at least 300 mapped syscalls, got {}",
            known
        );
    }

    #[test]
    fn test_event_format() {
        let event = SyscallEvent {
            nr: 64,
            name: "write",
            args: [1, 0x80000, 12, 0, 0, 0],
            ret: Some(12),
            pc: 0x80001000,
        };
        let s = event.to_string();
        assert!(s.contains("write"));
        assert!(s.contains("= 0x0000000C"));
    }

    #[test]
    fn test_all_key_syscalls_present() {
        // Verify every syscall a typical Linux userspace program uses
        let key_syscalls = [
            (56, "openat"),
            (57, "close"),
            (63, "read"),
            (64, "write"),
            (62, "lseek"),
            (93, "exit"),
            (94, "exit_group"),
            (98, "futex"),
            (162, "setdomainname"),
            (174, "getuid"),
            (176, "getgid"),
            (212, "recvmsg"),
            (214, "brk"),
            (217, "add_key"),
            (220, "clone"),
            (221, "execve"),
            (222, "mmap"),
            (226, "mprotect"),
            (233, "madvise"),
            (260, "wait4"),
            (278, "getrandom"),
            (291, "statx"),
        ];
        for (nr, expected) in &key_syscalls {
            assert_eq!(syscall_name(*nr), *expected, "syscall {} mismatch", nr);
        }
    }
}
