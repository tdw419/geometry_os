; DESCRIPTION: Draws a red object at the screen with fixed size.

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
    ; Create a pipe: read fd in r6, write fd in r13
    PIPE r6, r13

    ; Spawn child process at label 'child'
    LDI r5, child
    SPAWN r5

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r5, write_buf
    LDI r3, 3
    WRITE r13, r5, r3

    ; Spin until child signals done
wait:
    LDI r5, done_flag
    LOAD r3, r5
    LDI r8, 0
    CMP r3, r8
    BLT r3, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r5, read_buf
    LDI r3, 3
    READ r6, r5, r3

    ; Draw row 0: red (read_buf[0])
    LDI r2, read_buf
    LOAD r13, r2
    LDI r5, 0       ; x
    LDI r3, 0       ; y
    LDI r8, 80      ; w
    LDI r15, 20      ; h
    RECTF r5, r3, r8, r15, r13

    ; Draw row 1: green (read_buf[1])
    LDI r2, read_buf
    LDI r1, 1
    ADD r2, r1
    LOAD r13, r2
    LDI r3, 20      ; y
    RECTF r5, r3, r8, r15, r13

    ; Draw row 2: blue (read_buf[2])
    LDI r2, read_buf
    LDI r1, 2
    ADD r2, r1
    LOAD r13, r2
    LDI r3, 40      ; y
    RECTF r5, r3, r8, r15, r13

    ; Signal done
    LDI r5, done_flag
    LDI r3, 1
    STORE r5, r3

    HALT
