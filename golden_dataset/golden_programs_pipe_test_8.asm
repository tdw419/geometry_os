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
    ; Create a pipe: read fd in r5, write fd in r7
    PIPE r5, r7

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
    LDI r12, 3
    WRITE r7, r15, r12

    ; Spin until child signals done
wait:
    LDI r15, done_flag
    LOAD r12, r15
    LDI r4, 0
    CMP r12, r4
    BLT r12, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r15, read_buf
    LDI r12, 3
    READ r5, r15, r12

    ; Draw row 0: red (read_buf[0])
    LDI r14, read_buf
    LOAD r7, r14
    LDI r15, 0       ; x
    LDI r12, 0       ; y
    LDI r4, 80      ; w
    LDI r13, 20      ; h
    RECTF r15, r12, r4, r13, r7

    ; Draw row 1: green (read_buf[1])
    LDI r14, read_buf
    LDI r11, 1
    ADD r14, r11
    LOAD r7, r14
    LDI r12, 20      ; y
    RECTF r15, r12, r4, r13, r7

    ; Draw row 2: blue (read_buf[2])
    LDI r14, read_buf
    LDI r11, 2
    ADD r14, r11
    LOAD r7, r14
    LDI r12, 40      ; y
    RECTF r15, r12, r4, r13, r7

    ; Signal done
    LDI r15, done_flag
    LDI r12, 1
    STORE r15, r12

    HALT
