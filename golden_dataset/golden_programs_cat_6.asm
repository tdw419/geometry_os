; DESCRIPTION: This GeOS assembly code reads the contents of "hello.txt" from the virtual filesystem (VFS) and displays it on the screen at coordinates (2, 10). It uses the OPEN, READ, CLOSE opcodes to handle file operations. If the file doesn't exist, the program halts cleanly without displaying anything.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r8, 0x1000
LDI r1, 104      ; h
STORE r8, r1
LDI r8, 0x1001
LDI r1, 101      ; e
STORE r8, r1
LDI r8, 0x1002
LDI r1, 108      ; l
STORE r8, r1
LDI r8, 0x1003
LDI r1, 108      ; l
STORE r8, r1
LDI r8, 0x1004
LDI r1, 111      ; o
STORE r8, r1
LDI r8, 0x1005
LDI r1, 46       ; .
STORE r8, r1
LDI r8, 0x1006
LDI r1, 116      ; t
STORE r8, r1
LDI r8, 0x1007
LDI r1, 120      ; x
STORE r8, r1
LDI r8, 0x1008
LDI r1, 116      ; t
STORE r8, r1
LDI r8, 0x1009
LDI r1, 0        ; null terminator
STORE r8, r1

; ── Open file for reading (mode 0 = read) ──
LDI r13, 0x1000   ; r13 = pointer to filename
LDI r10, 0        ; r10 = mode (read)
OPEN r13, r10       ; r1 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r12, r1       ; r12 = saved fd
LDI r2, 0x2000   ; r2 = read buffer address
LDI r4, 200      ; r4 = max bytes to read
READ r12, r2, r4  ; r1 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r1 = 0xFFFFFFFF)
LDI r6, 200
CMP r1, r6
BLT r1, do_terminate
LDI r1, 200
do_terminate:
LDI r6, 0x2000   ; buffer start
ADD r1, r6       ; r1 = buffer start + bytes_read = end address
LDI r11, 0
STORE r1, r11     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r13, 2        ; x position
LDI r10, 10       ; y position
LDI r2, 0x2000   ; pointer to string buffer
TEXT r13, r10, r2

; ── Close the file ──
CLOSE r12
HALT
