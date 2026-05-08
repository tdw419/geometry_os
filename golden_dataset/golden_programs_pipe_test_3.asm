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
    ; Create a pipe: read fd in r9, write fd in r0
    PIPE r9, r0

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
    LDI r14, 3
    WRITE r0, r1, r14

    ; Spin until child signals done
wait:
    LDI r1, done_flag
    LOAD r14, r1
    LDI r5, 0
    CMP r14, r5
    BLT r14, wait
    HALT

; -- Child process: reads from pipe, draws 3 rows --
.org 0x100
child:
    ; Read 3 words from pipe into read_buf (blocks if empty)
    LDI r1, read_buf
    LDI r14, 3
    READ r9, r1, r14

    ; Draw row 0: red (read_buf[0])
    LDI r6, read_buf
    LOAD r0, r6
    LDI r1, 0       ; x
    LDI r14, 0       ; y
    LDI r5, 80      ; w
    LDI r12, 20      ; h
    RECTF r1, r14, r5, r12, r0

    ; Draw row 1: green (read_buf[1])
    LDI r6, read_buf
    LDI r8, 1
    ADD r6, r8
    LOAD r0, r6
    LDI r14, 20      ; y
    RECTF r1, r14, r5, r12, r0

    ; Draw row 2: blue (read_buf[2])
    LDI r6, read_buf
    LDI r8, 2
    ADD r6, r8
    LOAD r0, r6
    LDI r14, 40      ; y
    RECTF r1, r14, r5, r12, r0

    ; Signal done
    LDI r1, done_flag
    LDI r14, 1
    STORE r1, r14

    HALT
