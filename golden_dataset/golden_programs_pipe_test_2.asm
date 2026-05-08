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
    ; Create a pipe: read fd in r13, write fd in r2
    PIPE r13, r2

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
    LDI r5, 3
    WRITE r2, r7, r5

    ; Spin until child signals done
wait:
    LDI r7, done_flag
    LOAD r5, r7
    LDI r12, 0
    CMP r5, r12
    BLT r5, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r7, read_buf
    LDI r5, 3
    READ r13, r7, r5

    ; Draw row 0: red (read_buf[0])
    LDI r10, read_buf
    LOAD r2, r10
    LDI r7, 0       ; x
    LDI r5, 0       ; y
    LDI r12, 80      ; w
    LDI r9, 20      ; h
    RECTF r7, r5, r12, r9, r2

    ; Draw row 1: green (read_buf[1])
    LDI r10, read_buf
    LDI r8, 1
    ADD r10, r8
    LOAD r2, r10
    LDI r5, 20      ; y
    RECTF r7, r5, r12, r9, r2

    ; Draw row 2: blue (read_buf[2])
    LDI r10, read_buf
    LDI r8, 2
    ADD r10, r8
    LOAD r2, r10
    LDI r5, 40      ; y
    RECTF r7, r5, r12, r9, r2

    ; Signal done
    LDI r7, done_flag
    LDI r5, 1
    STORE r7, r5

    HALT
