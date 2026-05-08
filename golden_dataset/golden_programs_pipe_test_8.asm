; DESCRIPTION: Display a object using color red at the screen.

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
    ; Create a pipe: read fd in r13, write fd in r8
    PIPE r13, r8

    ; Spawn child process at label 'child'
    LDI r1, child
    SPAWN r1

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r1, write_buf
    LDI r12, 3
    WRITE r8, r1, r12

    ; Spin until child signals done
wait:
    LDI r1, done_flag
    LOAD r12, r1
    LDI r6, 0
    CMP r12, r6
    BLT r12, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r1, read_buf
    LDI r12, 3
    READ r13, r1, r12

    ; Draw row 0: red (read_buf[0])
    LDI r11, read_buf
    LOAD r8, r11
    LDI r1, 0       ; x
    LDI r12, 0       ; y
    LDI r6, 80      ; w
    LDI r0, 20      ; h
    RECTF r1, r12, r6, r0, r8

    ; Draw row 1: green (read_buf[1])
    LDI r11, read_buf
    LDI r4, 1
    ADD r11, r4
    LOAD r8, r11
    LDI r12, 20      ; y
    RECTF r1, r12, r6, r0, r8

    ; Draw row 2: blue (read_buf[2])
    LDI r11, read_buf
    LDI r4, 2
    ADD r11, r4
    LOAD r8, r11
    LDI r12, 40      ; y
    RECTF r1, r12, r6, r0, r8

    ; Signal done
    LDI r1, done_flag
    LDI r12, 1
    STORE r1, r12

    HALT
