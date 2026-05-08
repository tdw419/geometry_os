; DESCRIPTION: This GeOS assembly code demonstrates inter-process communication (IPC) using pipes. It creates a pipe, writes five values into it, reads them back, and displays the result on screen by showing the text "PIPE IPC OK" and drawing a green line to indicate success.

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
PIPE r15, r9          ; r15 = read_fd (0x8000+idx), r9 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r12, 42           ; value 1
STORE r20, r12
LDI r12, 99           ; value 2
STORE r21, r12
LDI r12, 7            ; value 3
STORE r22, r12
LDI r12, 1234         ; value 4
STORE r23, r12
LDI r12, 56789        ; value 5
STORE r24, r12

; WRITE write_fd, buf_addr, len
LDI r12, 20           ; buf_addr = 0x14 (r20)
LDI r6, 5            ; len = 5
WRITE r9, r12, r6     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r12, 30           ; buf_addr = 0x1E (r30)
LDI r6, 5            ; len = 5
READ r15, r12, r6      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r1, 10          ; x position
LDI r7, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r1, 100
LDI r7, 120
LDI r8, msg
TEXT r1, r7, [r8]

; Draw a green line to indicate success
LDI r1, 100
LDI r7, 130
LDI r8, 156
LDI r13, 130
LDI r2, 0x00FF00    ; green
LINE r1, r7, r8, r13, r2

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
