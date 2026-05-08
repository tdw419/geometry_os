; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r4, 0x1000
LDI r13, 104      ; h
STORE r4, r13
LDI r4, 0x1001
LDI r13, 101      ; e
STORE r4, r13
LDI r4, 0x1002
LDI r13, 108      ; l
STORE r4, r13
LDI r4, 0x1003
LDI r13, 108      ; l
STORE r4, r13
LDI r4, 0x1004
LDI r13, 111      ; o
STORE r4, r13
LDI r4, 0x1005
LDI r13, 46       ; .
STORE r4, r13
LDI r4, 0x1006
LDI r13, 116      ; t
STORE r4, r13
LDI r4, 0x1007
LDI r13, 120      ; x
STORE r4, r13
LDI r4, 0x1008
LDI r13, 116      ; t
STORE r4, r13
LDI r4, 0x1009
LDI r13, 0        ; null terminator
STORE r4, r13

; ── Open file for reading (mode 0 = read) ──
LDI r7, 0x1000   ; r7 = pointer to filename
LDI r11, 0        ; r11 = mode (read)
OPEN r7, r11       ; r13 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r15, r13       ; r15 = saved fd
LDI r6, 0x2000   ; r6 = read buffer address
LDI r0, 200      ; r0 = max bytes to read
READ r15, r6, r0  ; r13 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r13 = 0xFFFFFFFF)
LDI r3, 200
CMP r13, r3
BLT r13, do_terminate
LDI r13, 200
do_terminate:
LDI r3, 0x2000   ; buffer start
ADD r13, r3       ; r13 = buffer start + bytes_read = end address
LDI r2, 0
STORE r13, r2     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r7, 2        ; x position
LDI r11, 10       ; y position
LDI r6, 0x2000   ; pointer to string buffer
TEXT r7, r11, r6

; ── Close the file ──
CLOSE r15
HALT
