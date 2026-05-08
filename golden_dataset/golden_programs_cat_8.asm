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
LDI r0, 104      ; h
STORE r10, r0
LDI r10, 0x1001
LDI r0, 101      ; e
STORE r10, r0
LDI r10, 0x1002
LDI r0, 108      ; l
STORE r10, r0
LDI r10, 0x1003
LDI r0, 108      ; l
STORE r10, r0
LDI r10, 0x1004
LDI r0, 111      ; o
STORE r10, r0
LDI r10, 0x1005
LDI r0, 46       ; .
STORE r10, r0
LDI r10, 0x1006
LDI r0, 116      ; t
STORE r10, r0
LDI r10, 0x1007
LDI r0, 120      ; x
STORE r10, r0
LDI r10, 0x1008
LDI r0, 116      ; t
STORE r10, r0
LDI r10, 0x1009
LDI r0, 0        ; null terminator
STORE r10, r0

; ── Open file for reading (mode 0 = read) ──
LDI r2, 0x1000   ; r2 = pointer to filename
LDI r8, 0        ; r8 = mode (read)
OPEN r2, r8       ; r0 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r13, r0       ; r13 = saved fd
LDI r9, 0x2000   ; r9 = read buffer address
LDI r4, 200      ; r4 = max bytes to read
READ r13, r9, r4  ; r0 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r0 = 0xFFFFFFFF)
LDI r14, 200
CMP r0, r14
BLT r0, do_terminate
LDI r0, 200
do_terminate:
LDI r14, 0x2000   ; buffer start
ADD r0, r14       ; r0 = buffer start + bytes_read = end address
LDI r5, 0
STORE r0, r5     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r2, 2        ; x position
LDI r8, 10       ; y position
LDI r9, 0x2000   ; pointer to string buffer
TEXT r2, r8, r9

; ── Close the file ──
CLOSE r13
HALT
