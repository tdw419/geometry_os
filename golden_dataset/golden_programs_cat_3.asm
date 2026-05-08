; DESCRIPTION: This GeOS assembly code reads the contents of "hello.txt" from the virtual filesystem (VFS) and displays it on the screen at coordinates (2, 10). It uses the OPEN, READ, CLOSE opcodes to handle file operations. If the file doesn't exist, the program halts cleanly without displaying anything.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r15, 0x1000
LDI r8, 104      ; h
STORE r15, r8
LDI r15, 0x1001
LDI r8, 101      ; e
STORE r15, r8
LDI r15, 0x1002
LDI r8, 108      ; l
STORE r15, r8
LDI r15, 0x1003
LDI r8, 108      ; l
STORE r15, r8
LDI r15, 0x1004
LDI r8, 111      ; o
STORE r15, r8
LDI r15, 0x1005
LDI r8, 46       ; .
STORE r15, r8
LDI r15, 0x1006
LDI r8, 116      ; t
STORE r15, r8
LDI r15, 0x1007
LDI r8, 120      ; x
STORE r15, r8
LDI r15, 0x1008
LDI r8, 116      ; t
STORE r15, r8
LDI r15, 0x1009
LDI r8, 0        ; null terminator
STORE r15, r8

; ── Open file for reading (mode 0 = read) ──
LDI r5, 0x1000   ; r5 = pointer to filename
LDI r2, 0        ; r2 = mode (read)
OPEN r5, r2       ; r8 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r11, r8       ; r11 = saved fd
LDI r0, 0x2000   ; r0 = read buffer address
LDI r7, 200      ; r7 = max bytes to read
READ r11, r0, r7  ; r8 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r8 = 0xFFFFFFFF)
LDI r3, 200
CMP r8, r3
BLT r8, do_terminate
LDI r8, 200
do_terminate:
LDI r3, 0x2000   ; buffer start
ADD r8, r3       ; r8 = buffer start + bytes_read = end address
LDI r13, 0
STORE r8, r13     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r5, 2        ; x position
LDI r2, 10       ; y position
LDI r0, 0x2000   ; pointer to string buffer
TEXT r5, r2, r0

; ── Close the file ──
CLOSE r11
HALT
