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
    ; Create a pipe: read fd in r0, write fd in r13
    PIPE r0, r13

    ; Spawn child process at label 'child'
    LDI r7, child
    SPAWN r7

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r7, write_buf
    LDI r4, 3
    WRITE r13, r7, r4

    ; Spin until child signals done
wait:
    LDI r7, done_flag
    LOAD r4, r7
    LDI r15, 0
    CMP r4, r15
    BLT r4, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r7, read_buf
    LDI r4, 3
    READ r0, r7, r4

    ; Draw row 0: red (read_buf[0])
    LDI r3, read_buf
    LOAD r13, r3
    LDI r7, 0       ; x
    LDI r4, 0       ; y
    LDI r15, 80      ; w
    LDI r11, 20      ; h
    RECTF r7, r4, r15, r11, r13

    ; Draw row 1: green (read_buf[1])
    LDI r3, read_buf
    LDI r2, 1
    ADD r3, r2
    LOAD r13, r3
    LDI r4, 20      ; y
    RECTF r7, r4, r15, r11, r13

    ; Draw row 2: blue (read_buf[2])
    LDI r3, read_buf
    LDI r2, 2
    ADD r3, r2
    LOAD r13, r3
    LDI r4, 40      ; y
    RECTF r7, r4, r15, r11, r13

    ; Signal done
    LDI r7, done_flag
    LDI r4, 1
    STORE r7, r4

    HALT
