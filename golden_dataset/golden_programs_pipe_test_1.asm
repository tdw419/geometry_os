; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
    ; Create a pipe: read fd in r4, write fd in r8
    PIPE r4, r8

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
    LDI r12, 3
    WRITE r8, r7, r12

    ; Spin until child signals done
wait:
    LDI r7, done_flag
    LOAD r12, r7
    LDI r3, 0
    CMP r12, r3
    BLT r12, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r7, read_buf
    LDI r12, 3
    READ r4, r7, r12

    ; Draw row 0: red (read_buf[0])
    LDI r2, read_buf
    LOAD r8, r2
    LDI r7, 0       ; x
    LDI r12, 0       ; y
    LDI r3, 80      ; w
    LDI r11, 20      ; h
    RECTF r7, r12, r3, r11, r8

    ; Draw row 1: green (read_buf[1])
    LDI r2, read_buf
    LDI r5, 1
    ADD r2, r5
    LOAD r8, r2
    LDI r12, 20      ; y
    RECTF r7, r12, r3, r11, r8

    ; Draw row 2: blue (read_buf[2])
    LDI r2, read_buf
    LDI r5, 2
    ADD r2, r5
    LOAD r8, r2
    LDI r12, 40      ; y
    RECTF r7, r12, r3, r11, r8

    ; Signal done
    LDI r7, done_flag
    LDI r12, 1
    STORE r7, r12

    HALT
