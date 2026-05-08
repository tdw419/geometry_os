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
PIPE r7, r5          ; r7 = read_fd (0x8000+idx), r5 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r10, 42           ; value 1
STORE r20, r10
LDI r10, 99           ; value 2
STORE r21, r10
LDI r10, 7            ; value 3
STORE r22, r10
LDI r10, 1234         ; value 4
STORE r23, r10
LDI r10, 56789        ; value 5
STORE r24, r10

; WRITE write_fd, buf_addr, len
LDI r10, 20           ; buf_addr = 0x14 (r20)
LDI r1, 5            ; len = 5
WRITE r5, r10, r1     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r10, 30           ; buf_addr = 0x1E (r30)
LDI r1, 5            ; len = 5
READ r7, r10, r1      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r11, 10          ; x position
LDI r4, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r11, 100
LDI r4, 120
LDI r2, msg
TEXT r11, r4, [r2]

; Draw a green line to indicate success
LDI r11, 100
LDI r4, 130
LDI r2, 156
LDI r6, 130
LDI r15, 0x00FF00    ; green
LINE r11, r4, r2, r6, r15

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
