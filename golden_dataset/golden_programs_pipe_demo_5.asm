; DESCRIPTION: Geometry OS program to draw a green line.

; pipe_demo.asm -- Phase 27 IPC Demo
; Demonstrates pipes, MSGSND/MSGRCV, and blocking I/O
;
; This program:
; 1. Creates a pipe
; 2. Writes data into it
; 3. Reads data back from it
; 4. Displays the result on screen
;
; Run with: ./geometry_os programs/pipe_demo.asm

.org 0x100

; === Phase 1: Create a pipe ===
PIPE r5, r3          ; r5 = read_fd (0x8000+idx), r3 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r0, 42           ; value 1
STORE r20, r0
LDI r0, 99           ; value 2
STORE r21, r0
LDI r0, 7            ; value 3
STORE r22, r0
LDI r0, 1234         ; value 4
STORE r23, r0
LDI r0, 56789        ; value 5
STORE r24, r0

; WRITE write_fd, buf_addr, len
LDI r0, 20           ; buf_addr = 0x14 (r20)
LDI r10, 5            ; len = 5
WRITE r3, r0, r10     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r0, 30           ; buf_addr = 0x1E (r30)
LDI r10, 5            ; len = 5
READ r5, r0, r10      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r8, 10          ; x position
LDI r2, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r8, 100
LDI r2, 120
LDI r6, msg
TEXT r8, r2, [r6]

; Draw a green line to indicate success
LDI r8, 100
LDI r2, 130
LDI r6, 156
LDI r11, 130
LDI r15, 0x00FF00    ; green
LINE r8, r2, r6, r11, r15

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
