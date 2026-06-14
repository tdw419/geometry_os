// Pixel-native hypervisor components
//
// These implementations replace traditional xv6 kernel syscalls with
// direct spatial operations on the Memory Palace substrate.

pub mod write_syscall;
pub mod fork_syscall;
pub mod openat_syscall;
pub mod close_syscall;
pub mod read_syscall;
pub mod exit_syscall;
pub mod execve_syscall;
pub mod getdents_syscall;
pub mod fstatat_syscall;
pub mod unlink_syscall;
pub mod brk_syscall;
pub mod mmap_syscall;
pub mod munmap_syscall;
pub mod pipe2_syscall;
pub mod getpid_syscall;
pub mod rmdir_syscall;
pub mod wait_syscall;
pub mod dup2_syscall;
pub mod chdir_syscall;
pub mod mkdir_syscall;
pub mod lseek_syscall;
pub mod faccessat_syscall;
pub mod renameat2_syscall;
pub mod getppid_syscall;
pub mod getuid_syscall;
pub mod geteuid_syscall;
pub mod getgid_syscall;
pub mod getegid_syscall;
pub mod gettid_syscall;
pub mod set_tid_address_syscall;
pub mod mprotect_syscall;
pub mod madvise_syscall;
pub mod umask_syscall;
pub mod exit_group_syscall;
pub mod fstat_syscall;
pub mod writev_syscall;
pub mod readv_syscall;
pub mod pread64_syscall;
pub mod pwrite64_syscall;
pub mod ioctl_syscall;
pub mod clock_gettime_syscall;
pub mod nanosleep_syscall;
pub mod clock_nanosleep_syscall;
pub mod uname_syscall;
pub mod sysinfo_syscall;
pub mod gettimeofday_syscall;
pub mod clock_getres_syscall;
pub mod prlimit64_syscall;
pub mod getrandom_syscall;
pub mod memfd_create_syscall;
pub mod rt_sigaction_syscall;
pub mod rt_sigprocmask_syscall;
pub mod kill_syscall;
pub mod futex_syscall;
pub mod dup_syscall;
pub mod unlinkat_syscall;
pub mod renameat_syscall;
pub mod mkdirat_syscall;
pub mod readlinkat_syscall;
pub mod poll_syscall;
pub mod fcntl_syscall;
pub mod sched_yield_syscall;
pub mod sigaltstack_syscall;
pub mod setuid_syscall;
pub mod setgid_syscall;
pub mod getrlimit_syscall;
pub mod setrlimit_syscall;
pub mod socketpair_syscall;
pub mod waitid_syscall;
pub mod socket_syscall;
pub mod connect_syscall;
pub mod sendto_syscall;
pub mod recvfrom_syscall;
pub mod shutdown_syscall;
pub mod integration;

#[cfg(test)]
mod tests;

#[cfg(test)]
mod lseek_tests;

// Re-export main integration functions
pub use integration::dispatch_syscall_pixel_native;

#[cfg(test)]
mod expansion_tests;