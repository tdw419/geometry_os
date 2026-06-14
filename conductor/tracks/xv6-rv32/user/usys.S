# RISC-V 32-bit syscall stubs for xv6 user programs.
# Each stub loads the syscall number into a7 and calls ecall.
# Arguments are already in a0-a5 (standard calling convention).

# syscall numbers
.equ SYS_fork,    1
.equ SYS_exit,    2
.equ SYS_wait,    3
.equ SYS_pipe,    4
.equ SYS_read,    5
.equ SYS_kill,    6
.equ SYS_exec,    7
.equ SYS_fstat,   8
.equ SYS_chdir,   9
.equ SYS_dup,     10
.equ SYS_getpid,  11
.equ SYS_sbrk,    12
.equ SYS_pause,   13
.equ SYS_uptime,  14
.equ SYS_open,    15
.equ SYS_write,   16
.equ SYS_mknod,   17
.equ SYS_unlink,  18
.equ SYS_link,    19
.equ SYS_mkdir,   20
.equ SYS_close,   21

.text

.globl fork
fork:
    li a7, SYS_fork
    ecall
    ret

.globl exit
exit:
    li a7, SYS_exit
    ecall
    # exit never returns, but ret anyway for safety
    ret

.globl wait
wait:
    li a7, SYS_wait
    ecall
    ret

.globl pipe
pipe:
    li a7, SYS_pipe
    ecall
    ret

.globl read
read:
    li a7, SYS_read
    ecall
    ret

.globl write
write:
    li a7, SYS_write
    ecall
    ret

.globl close
close:
    li a7, SYS_close
    ecall
    ret

.globl kill
kill:
    li a7, SYS_kill
    ecall
    ret

.globl exec
exec:
    li a7, SYS_exec
    ecall
    ret

.globl open
open:
    li a7, SYS_open
    ecall
    ret

.globl mknod
mknod:
    li a7, SYS_mknod
    ecall
    ret

.globl unlink
unlink:
    li a7, SYS_unlink
    ecall
    ret

.globl fstat
fstat:
    li a7, SYS_fstat
    ecall
    ret

.globl link
link:
    li a7, SYS_link
    ecall
    ret

.globl mkdir
mkdir:
    li a7, SYS_mkdir
    ecall
    ret

.globl chdir
chdir:
    li a7, SYS_chdir
    ecall
    ret

.globl dup
dup:
    li a7, SYS_dup
    ecall
    ret

.globl getpid
getpid:
    li a7, SYS_getpid
    ecall
    ret

.globl sbrk
sbrk:
    li a7, SYS_sbrk
    ecall
    ret

.globl sleep
sleep:
    li a7, 22
    ecall
    ret

.globl pause
pause:
    li a7, SYS_pause
    ecall
    ret

.globl uptime
uptime:
    li a7, SYS_uptime
    ecall
    ret
