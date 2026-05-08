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
    ; Create a pipe: read fd in r13, write fd in r6
    PIPE r13, r6

    ; Spawn child process at label 'child'
    LDI r11, child
    SPAWN r11

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r11, write_buf
    LDI r10, 3
    WRITE r6, r11, r10

    ; Spin until child signals done
wait:
    LDI r11, done_flag
    LOAD r10, r11
    LDI r12, 0
    CMP r10, r12
    BLT r10, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r11, read_buf
    LDI r10, 3
    READ r13, r11, r10

    ; Draw row 0: red (read_buf[0])
    LDI r2, read_buf
    LOAD r6, r2
    LDI r11, 0       ; x
    LDI r10, 0       ; y
    LDI r12, 80      ; w
    LDI r3, 20      ; h
    RECTF r11, r10, r12, r3, r6

    ; Draw row 1: green (read_buf[1])
    LDI r2, read_buf
    LDI r1, 1
    ADD r2, r1
    LOAD r6, r2
    LDI r10, 20      ; y
    RECTF r11, r10, r12, r3, r6

    ; Draw row 2: blue (read_buf[2])
    LDI r2, read_buf
    LDI r1, 2
    ADD r2, r1
    LOAD r6, r2
    LDI r10, 40      ; y
    RECTF r11, r10, r12, r3, r6

    ; Signal done
    LDI r11, done_flag
    LDI r10, 1
    STORE r11, r10

    HALT
