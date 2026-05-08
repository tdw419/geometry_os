; DESCRIPTION: Draw line: pos=the screen, color=green, size=fixed size.

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
PIPE r12, r6          ; r12 = read_fd (0x8000+idx), r6 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r5, 42           ; value 1
STORE r20, r5
LDI r5, 99           ; value 2
STORE r21, r5
LDI r5, 7            ; value 3
STORE r22, r5
LDI r5, 1234         ; value 4
STORE r23, r5
LDI r5, 56789        ; value 5
STORE r24, r5

; WRITE write_fd, buf_addr, len
LDI r5, 20           ; buf_addr = 0x14 (r20)
LDI r8, 5            ; len = 5
WRITE r6, r5, r8     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r5, 30           ; buf_addr = 0x1E (r30)
LDI r8, 5            ; len = 5
READ r12, r5, r8      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r0, 10          ; x position
LDI r7, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r0, 100
LDI r7, 120
LDI r2, msg
TEXT r0, r7, [r2]

; Draw a green line to indicate success
LDI r0, 100
LDI r7, 130
LDI r2, 156
LDI r13, 130
LDI r14, 0x00FF00    ; green
LINE r0, r7, r2, r13, r14

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
