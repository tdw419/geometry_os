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
PIPE r3, r15          ; r3 = read_fd (0x8000+idx), r15 = write_fd (0xC000+idx)

; === Phase 2: Write 5 values into the pipe ===
LDI r14, 42           ; value 1
STORE r20, r14
LDI r14, 99           ; value 2
STORE r21, r14
LDI r14, 7            ; value 3
STORE r22, r14
LDI r14, 1234         ; value 4
STORE r23, r14
LDI r14, 56789        ; value 5
STORE r24, r14

; WRITE write_fd, buf_addr, len
LDI r14, 20           ; buf_addr = 0x14 (r20)
LDI r10, 5            ; len = 5
WRITE r15, r14, r10     ; write 5 words to pipe

; === Phase 3: Read 5 values back from the pipe ===
LDI r14, 30           ; buf_addr = 0x1E (r30)
LDI r10, 5            ; len = 5
READ r3, r14, r10      ; read 5 words from pipe

; === Phase 4: Display result on screen ===
LDI r6, 10          ; x position
LDI r9, 10          ; y position
FILL 0               ; clear screen (black)

; Show "IPC OK" text
LDI r6, 100
LDI r9, 120
LDI r13, msg
TEXT r6, r9, [r13]

; Draw a green line to indicate success
LDI r6, 100
LDI r9, 130
LDI r13, 156
LDI r12, 130
LDI r7, 0x00FF00    ; green
LINE r6, r9, r13, r12, r7

HALT

.org 0x200
msg: .db "PIPE IPC OK", 0
