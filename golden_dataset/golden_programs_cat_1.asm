; DESCRIPTION: Render a colored object at the screen.

; cat.asm -- Read a file and display its contents on screen
; Opens "hello.txt" from the VFS and renders it using TEXT opcode.
; Uses OPEN, READ, CLOSE opcodes from Phase 25 (Filesystem).
;
; Before running: create a file in .geometry_os/fs/hello.txt
;
; If the file doesn't exist, the program displays nothing and halts cleanly.

; ── Store filename "hello.txt" at 0x1000 (one ASCII byte per RAM cell) ──
LDI r0, 0x1000
LDI r10, 104      ; h
STORE r0, r10
LDI r0, 0x1001
LDI r10, 101      ; e
STORE r0, r10
LDI r0, 0x1002
LDI r10, 108      ; l
STORE r0, r10
LDI r0, 0x1003
LDI r10, 108      ; l
STORE r0, r10
LDI r0, 0x1004
LDI r10, 111      ; o
STORE r0, r10
LDI r0, 0x1005
LDI r10, 46       ; .
STORE r0, r10
LDI r0, 0x1006
LDI r10, 116      ; t
STORE r0, r10
LDI r0, 0x1007
LDI r10, 120      ; x
STORE r0, r10
LDI r0, 0x1008
LDI r10, 116      ; t
STORE r0, r10
LDI r0, 0x1009
LDI r10, 0        ; null terminator
STORE r0, r10

; ── Open file for reading (mode 0 = read) ──
LDI r8, 0x1000   ; r8 = pointer to filename
LDI r2, 0        ; r2 = mode (read)
OPEN r8, r2       ; r10 = file descriptor (or 0xFFFFFFFF on error)

; ── Save fd, then read up to 200 bytes ──
MOV r5, r10       ; r5 = saved fd
LDI r15, 0x2000   ; r15 = read buffer address
LDI r13, 200      ; r13 = max bytes to read
READ r5, r15, r13  ; r10 = bytes actually read

; ── Null-terminate the buffer ──
; Clamp bytes_read to avoid overflow on error (r10 = 0xFFFFFFFF)
LDI r14, 200
CMP r10, r14
BLT r10, do_terminate
LDI r10, 200
do_terminate:
LDI r14, 0x2000   ; buffer start
ADD r10, r14       ; r10 = buffer start + bytes_read = end address
LDI r3, 0
STORE r10, r3     ; write null terminator

; ── Display file contents using TEXT opcode ──
LDI r8, 2        ; x position
LDI r2, 10       ; y position
LDI r15, 0x2000   ; pointer to string buffer
TEXT r8, r2, r15

; ── Close the file ──
CLOSE r5
HALT
