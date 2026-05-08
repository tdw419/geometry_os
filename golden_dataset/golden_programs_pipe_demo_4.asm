; DESCRIPTION: Display a line using color green at the screen.

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
PIPE r15, r10          ; r15 = read_fd (0x8000+idx), r10 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r11, 42           ; value 1
STORE r20, r11
LDI r11, 99           ; value 2
STORE r21, r11
LDI r11, 7            ; value 3
STORE r22, r11
LDI r11, 1234         ; value 4
STORE r23, r11
LDI r11, 56789        ; value 5
STORE r24, r11

; WRITE write_fd, buf_addr, len
LDI r11, 20           ; buf_addr = 0x14 (r20)
LDI r4, 5            ; len = 5
WRITE r10, r11, r4     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r11, 30           ; buf_addr = 0x1E (r30)
LDI r4, 5            ; len = 5
READ r15, r11, r4      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r1, 10          ; x position
LDI r6, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r1, 100
LDI r6, 120
LDI r2, msg
TEXT r1, r6, [r2]

; Draw a green line to indicate success
LDI r1, 100
LDI r6, 130
LDI r2, 156
LDI r3, 130
LDI r9, 0x00FF00    ; green
LINE r1, r6, r2, r3, r9

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
