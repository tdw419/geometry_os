; DESCRIPTION: This GeOS assembly code sets up an inter-process communication (IPC) pipe between a parent and child process. The parent writes three color values through the pipe, which the child reads and uses to draw three colored rows on the screen.

; pipe_test.asm -- Phase 27: IPC pipe test
; Parent creates a pipe, spawns a child,
; writes 3 color words through the pipe.
; Child reads them and draws 3 colored rows.
;
; Controls: none (automatic)
; Opcodes: SPAWN, PIPE, WRITE, READ, HALT, RECTF

; -- Data area at 0xD00 --
.org 0xD00
write_buf:
    .db 0x00FF0000   ; red
    .db 0x0000FF00   ; green
    .db 0x000000FF   ; blue
read_buf:
    .db 0
    .db 0
    .db 0
done_flag:
    .db 0

; -- Main program at 0x000 --
.org 0x000
    ; Create a pipe: read fd in r11, write fd in r6
    PIPE r11, r6

    ; Spawn child process at label 'child'
    LDI r15, child
    SPAWN r15

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r15, write_buf
    LDI r13, 3
    WRITE r6, r15, r13

    ; Spin until child signals done
wait:
    LDI r15, done_flag
    LOAD r13, r15
    LDI r10, 0
    CMP r13, r10
    BLT r13, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r15, read_buf
    LDI r13, 3
    READ r11, r15, r13

    ; Draw row 0: red (read_buf[0])
    LDI r5, read_buf
    LOAD r6, r5
    LDI r15, 0       ; x
    LDI r13, 0       ; y
    LDI r10, 80      ; w
    LDI r9, 20      ; h
    RECTF r15, r13, r10, r9, r6

    ; Draw row 1: green (read_buf[1])
    LDI r5, read_buf
    LDI r14, 1
    ADD r5, r14
    LOAD r6, r5
    LDI r13, 20      ; y
    RECTF r15, r13, r10, r9, r6

    ; Draw row 2: blue (read_buf[2])
    LDI r5, read_buf
    LDI r14, 2
    ADD r5, r14
    LOAD r6, r5
    LDI r13, 40      ; y
    RECTF r15, r13, r10, r9, r6

    ; Signal done
    LDI r15, done_flag
    LDI r13, 1
    STORE r15, r13

    HALT
