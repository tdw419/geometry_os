; DESCRIPTION: Geometry OS program to draw a red object.

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
    ; Create a pipe: read fd in r3, write fd in r4
    PIPE r3, r4

    ; Spawn child process at label 'child'
    LDI r2, child
    SPAWN r2

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r2, write_buf
    LDI r12, 3
    WRITE r4, r2, r12

    ; Spin until child signals done
wait:
    LDI r2, done_flag
    LOAD r12, r2
    LDI r13, 0
    CMP r12, r13
    BLT r12, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r2, read_buf
    LDI r12, 3
    READ r3, r2, r12

    ; Draw row 0: red (read_buf[0])
    LDI r14, read_buf
    LOAD r4, r14
    LDI r2, 0       ; x
    LDI r12, 0       ; y
    LDI r13, 80      ; w
    LDI r8, 20      ; h
    RECTF r2, r12, r13, r8, r4

    ; Draw row 1: green (read_buf[1])
    LDI r14, read_buf
    LDI r15, 1
    ADD r14, r15
    LOAD r4, r14
    LDI r12, 20      ; y
    RECTF r2, r12, r13, r8, r4

    ; Draw row 2: blue (read_buf[2])
    LDI r14, read_buf
    LDI r15, 2
    ADD r14, r15
    LOAD r4, r14
    LDI r12, 40      ; y
    RECTF r2, r12, r13, r8, r4

    ; Signal done
    LDI r2, done_flag
    LDI r12, 1
    STORE r2, r12

    HALT
