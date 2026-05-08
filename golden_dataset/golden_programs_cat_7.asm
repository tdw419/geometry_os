; DESCRIPTION: This GeOS assembly code reads the contents of "hello.txt" from the virtual filesystem (VFS) and displays it on the screen at coordinates (2, 10). It uses the OPEN, READ, CLOSE opcodes to handle file operations. If the file doesn't exist, the program halts cleanly without displaying anything.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r10, 0x1000
LDI r13, 104      ; h
STORE r10, r13
LDI r10, 0x1001
LDI r13, 101      ; e
STORE r10, r13
LDI r10, 0x1002
LDI r13, 108      ; l
STORE r10, r13
LDI r10, 0x1003
LDI r13, 108      ; l
STORE r10, r13
LDI r10, 0x1004
LDI r13, 111      ; o
STORE r10, r13
LDI r10, 0x1005
LDI r13, 46       ; .
STORE r10, r13
LDI r10, 0x1006
LDI r13, 116      ; t
STORE r10, r13
LDI r10, 0x1007
LDI r13, 120      ; x
STORE r10, r13
LDI r10, 0x1008
LDI r13, 116      ; t
STORE r10, r13
LDI r10, 0x1009
LDI r13, 0        ; null terminator
STORE r10, r13

; ── Open file for reading (mode 0 = read) ──
LDI r4, 0x1000   ; r4 = pointer to filename
LDI r3, 0        ; r3 = mode (read)
OPEN r4, r3       ; r13 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r14, r13       ; r14 = saved fd
LDI r12, 0x2000   ; r12 = read buffer address
LDI r6, 200      ; r6 = max bytes to read
READ r14, r12, r6  ; r13 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r13 = 0xFFFFFFFF)
LDI r15, 200
CMP r13, r15
BLT r13, do_terminate
LDI r13, 200
do_terminate:
LDI r15, 0x2000   ; buffer start
ADD r13, r15       ; r13 = buffer start + bytes_read = end address
LDI r5, 0
STORE r13, r5     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r4, 2        ; x position
LDI r3, 10       ; y position
LDI r12, 0x2000   ; pointer to string buffer
TEXT r4, r3, r12

; ── Close the file ──
CLOSE r14
HALT
