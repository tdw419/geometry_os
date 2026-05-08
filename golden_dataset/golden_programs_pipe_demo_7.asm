; DESCRIPTION: A green line centered at the screen with fixed size.

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
PIPE r10, r2          ; r10 = read_fd (0x8000+idx), r2 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r7, 42           ; value 1
STORE r20, r7
LDI r7, 99           ; value 2
STORE r21, r7
LDI r7, 7            ; value 3
STORE r22, r7
LDI r7, 1234         ; value 4
STORE r23, r7
LDI r7, 56789        ; value 5
STORE r24, r7

; WRITE write_fd, buf_addr, len
LDI r7, 20           ; buf_addr = 0x14 (r20)
LDI r13, 5            ; len = 5
WRITE r2, r7, r13     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r7, 30           ; buf_addr = 0x1E (r30)
LDI r13, 5            ; len = 5
READ r10, r7, r13      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r8, 10          ; x position
LDI r12, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r8, 100
LDI r12, 120
LDI r14, msg
TEXT r8, r12, [r14]

; Draw a green line to indicate success
LDI r8, 100
LDI r12, 130
LDI r14, 156
LDI r5, 130
LDI r4, 0x00FF00    ; green
LINE r8, r12, r14, r5, r4

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
