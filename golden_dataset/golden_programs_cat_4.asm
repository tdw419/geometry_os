; DESCRIPTION: This GeOS assembly code reads the contents of "hello.txt" from the virtual filesystem (VFS) and displays it on the screen at coordinates (2, 10). It uses the OPEN, READ, CLOSE opcodes to handle file operations. If the file doesn't exist, the program halts cleanly without displaying anything.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r5, 0x1000
LDI r0, 104      ; h
STORE r5, r0
LDI r5, 0x1001
LDI r0, 101      ; e
STORE r5, r0
LDI r5, 0x1002
LDI r0, 108      ; l
STORE r5, r0
LDI r5, 0x1003
LDI r0, 108      ; l
STORE r5, r0
LDI r5, 0x1004
LDI r0, 111      ; o
STORE r5, r0
LDI r5, 0x1005
LDI r0, 46       ; .
STORE r5, r0
LDI r5, 0x1006
LDI r0, 116      ; t
STORE r5, r0
LDI r5, 0x1007
LDI r0, 120      ; x
STORE r5, r0
LDI r5, 0x1008
LDI r0, 116      ; t
STORE r5, r0
LDI r5, 0x1009
LDI r0, 0        ; null terminator
STORE r5, r0

; ── Open file for reading (mode 0 = read) ──
LDI r10, 0x1000   ; r10 = pointer to filename
LDI r1, 0        ; r1 = mode (read)
OPEN r10, r1       ; r0 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r2, r0       ; r2 = saved fd
LDI r6, 0x2000   ; r6 = read buffer address
LDI r7, 200      ; r7 = max bytes to read
READ r2, r6, r7  ; r0 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r0 = 0xFFFFFFFF)
LDI r9, 200
CMP r0, r9
BLT r0, do_terminate
LDI r0, 200
do_terminate:
LDI r9, 0x2000   ; buffer start
ADD r0, r9       ; r0 = buffer start + bytes_read = end address
LDI r15, 0
STORE r0, r15     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r10, 2        ; x position
LDI r1, 10       ; y position
LDI r6, 0x2000   ; pointer to string buffer
TEXT r10, r1, r6

; ── Close the file ──
CLOSE r2
HALT
