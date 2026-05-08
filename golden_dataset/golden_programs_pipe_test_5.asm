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
    ; Create a pipe: read fd in r10, write fd in r13
    PIPE r10, r13

    ; Spawn child process at label 'child'
    LDI r9, child
    SPAWN r9

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r9, write_buf
    LDI r14, 3
    WRITE r13, r9, r14

    ; Spin until child signals done
wait:
    LDI r9, done_flag
    LOAD r14, r9
    LDI r11, 0
    CMP r14, r11
    BLT r14, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r9, read_buf
    LDI r14, 3
    READ r10, r9, r14

    ; Draw row 0: red (read_buf[0])
    LDI r12, read_buf
    LOAD r13, r12
    LDI r9, 0       ; x
    LDI r14, 0       ; y
    LDI r11, 80      ; w
    LDI r2, 20      ; h
    RECTF r9, r14, r11, r2, r13

    ; Draw row 1: green (read_buf[1])
    LDI r12, read_buf
    LDI r0, 1
    ADD r12, r0
    LOAD r13, r12
    LDI r14, 20      ; y
    RECTF r9, r14, r11, r2, r13

    ; Draw row 2: blue (read_buf[2])
    LDI r12, read_buf
    LDI r0, 2
    ADD r12, r0
    LOAD r13, r12
    LDI r14, 40      ; y
    RECTF r9, r14, r11, r2, r13

    ; Signal done
    LDI r9, done_flag
    LDI r14, 1
    STORE r9, r14

    HALT
