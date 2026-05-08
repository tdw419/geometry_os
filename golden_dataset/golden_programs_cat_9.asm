; DESCRIPTION: This GeOS assembly code reads the contents of "hello.txt" from the virtual filesystem (VFS) and displays it on the screen at coordinates (2, 10). It uses the OPEN, READ, CLOSE opcodes to handle file operations. If the file doesn't exist, the program halts cleanly without displaying anything.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r11, 0x1000
LDI r9, 104      ; h
STORE r11, r9
LDI r11, 0x1001
LDI r9, 101      ; e
STORE r11, r9
LDI r11, 0x1002
LDI r9, 108      ; l
STORE r11, r9
LDI r11, 0x1003
LDI r9, 108      ; l
STORE r11, r9
LDI r11, 0x1004
LDI r9, 111      ; o
STORE r11, r9
LDI r11, 0x1005
LDI r9, 46       ; .
STORE r11, r9
LDI r11, 0x1006
LDI r9, 116      ; t
STORE r11, r9
LDI r11, 0x1007
LDI r9, 120      ; x
STORE r11, r9
LDI r11, 0x1008
LDI r9, 116      ; t
STORE r11, r9
LDI r11, 0x1009
LDI r9, 0        ; null terminator
STORE r11, r9

; ── Open file for reading (mode 0 = read) ──
LDI r4, 0x1000   ; r4 = pointer to filename
LDI r14, 0        ; r14 = mode (read)
OPEN r4, r14       ; r9 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r0, r9       ; r0 = saved fd
LDI r2, 0x2000   ; r2 = read buffer address
LDI r1, 200      ; r1 = max bytes to read
READ r0, r2, r1  ; r9 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r9 = 0xFFFFFFFF)
LDI r5, 200
CMP r9, r5
BLT r9, do_terminate
LDI r9, 200
do_terminate:
LDI r5, 0x2000   ; buffer start
ADD r9, r5       ; r9 = buffer start + bytes_read = end address
LDI r10, 0
STORE r9, r10     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r4, 2        ; x position
LDI r14, 10       ; y position
LDI r2, 0x2000   ; pointer to string buffer
TEXT r4, r14, r2

; ── Close the file ──
CLOSE r0
HALT
