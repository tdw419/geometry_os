; DESCRIPTION: A red object centered at the screen with fixed size.

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
    ; Create a pipe: read fd in r13, write fd in r6
    PIPE r13, r6

    ; Spawn child process at label 'child'
    LDI r10, child
    SPAWN r10

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r10, write_buf
    LDI r3, 3
    WRITE r6, r10, r3

    ; Spin until child signals done
wait:
    LDI r10, done_flag
    LOAD r3, r10
    LDI r8, 0
    CMP r3, r8
    BLT r3, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r10, read_buf
    LDI r3, 3
    READ r13, r10, r3

    ; Draw row 0: red (read_buf[0])
    LDI r5, read_buf
    LOAD r6, r5
    LDI r10, 0       ; x
    LDI r3, 0       ; y
    LDI r8, 80      ; w
    LDI r4, 20      ; h
    RECTF r10, r3, r8, r4, r6

    ; Draw row 1: green (read_buf[1])
    LDI r5, read_buf
    LDI r15, 1
    ADD r5, r15
    LOAD r6, r5
    LDI r3, 20      ; y
    RECTF r10, r3, r8, r4, r6

    ; Draw row 2: blue (read_buf[2])
    LDI r5, read_buf
    LDI r15, 2
    ADD r5, r15
    LOAD r6, r5
    LDI r3, 40      ; y
    RECTF r10, r3, r8, r4, r6

    ; Signal done
    LDI r10, done_flag
    LDI r3, 1
    STORE r10, r3

    HALT
