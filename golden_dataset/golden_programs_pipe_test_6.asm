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
    ; Create a pipe: read fd in r4, write fd in r12
    PIPE r4, r12

    ; Spawn child process at label 'child'
    LDI r14, child
    SPAWN r14

    ; Small delay to let child start and block on READ
    LDI r20, 0
    LDI r21, 100
delay:
    ADD r20, r21
    CMP r20, r21
    BLT r20, delay

    ; Write 3 color words through the pipe
    LDI r14, write_buf
    LDI r1, 3
    WRITE r12, r14, r1

    ; Spin until child signals done
wait:
    LDI r14, done_flag
    LOAD r1, r14
    LDI r15, 0
    CMP r1, r15
    BLT r1, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r14, read_buf
    LDI r1, 3
    READ r4, r14, r1

    ; Draw row 0: red (read_buf[0])
    LDI r7, read_buf
    LOAD r12, r7
    LDI r14, 0       ; x
    LDI r1, 0       ; y
    LDI r15, 80      ; w
    LDI r13, 20      ; h
    RECTF r14, r1, r15, r13, r12

    ; Draw row 1: green (read_buf[1])
    LDI r7, read_buf
    LDI r9, 1
    ADD r7, r9
    LOAD r12, r7
    LDI r1, 20      ; y
    RECTF r14, r1, r15, r13, r12

    ; Draw row 2: blue (read_buf[2])
    LDI r7, read_buf
    LDI r9, 2
    ADD r7, r9
    LOAD r12, r7
    LDI r1, 40      ; y
    RECTF r14, r1, r15, r13, r12

    ; Signal done
    LDI r14, done_flag
    LDI r1, 1
    STORE r14, r1

    HALT
