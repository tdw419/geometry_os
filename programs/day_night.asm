; day_night.asm -- Day & Night Cellular Automaton (B3678/S34678)

LDI r7, 1
LDI r9, 64
LDI r10, 0x2000    ; current_grid
LDI r11, 0x3000    ; next_grid
LDI r12, 4
LDI r30, 0xFF00    ; stack pointer

; ===== Rule masks for Day & Night =====
LDI r26, 0x01C8    ; birth_mask
LDI r27, 0x01D8    ; survival_mask

; ===== Initialize random-ish pattern =====
LDI r29, 0xACE1    ; seed

LDI r0, 0          ; y = 0
init_y:
    LDI r1, 0      ; x = 0
init_x:
    MOV r5, r29    ; r5 = seed
    MOV r6, r5
    LDI r8, 0x8000
    AND r6, r8     ; extract MSB
    JZ r6, no_tap
    LDI r8, 0x002D
    XOR r5, r8     ; apply LFSR tap
no_tap:
    SHL r5, r7     ; shift left
    LDI r8, 0xFFFF
    AND r5, r8     ; keep 16-bit
    MOV r29, r5    ; save seed
    
    ; Set cell state: 50% chance ON
    LDI r8, 0x4000
    AND r5, r8
    JZ r5, cell_off
    LDI r4, 1
    JMP store_init
cell_off:
    LDI r4, 0
store_init:
    MOV r6, r0
    MUL r6, r9
    ADD r6, r1
    ADD r6, r10
    STORE r6, r4
    
    ADD r1, r7
    CMP r1, r9
    JNZ r1, init_x
    ADD r0, r7
    CMP r0, r9
    JNZ r0, init_y

; ===== Main loop =====
main_loop:
    LDI r0, 0
update_y:
    LDI r1, 0
update_x:
    LDI r3, 0        ; neighbor count = 0
    
    ; y-1 row
    SUB r0, r7
    SUB r1, r7
    CALL check_cell
    ADD r1, r7
    CALL check_cell
    ADD r1, r7
    CALL check_cell
    
    ; y row (skip center)
    ADD r0, r7
    SUB r1, r7
    SUB r1, r7
    CALL check_cell
    ADD r1, r7
    ADD r1, r7
    CALL check_cell
    
    ; y+1 row
    ADD r0, r7
    SUB r1, r7
    SUB r1, r7
    CALL check_cell
    ADD r1, r7
    CALL check_cell
    ADD r1, r7
    CALL check_cell
    
    ; restore y, x
    SUB r0, r7
    SUB r1, r7
    
    ; Get current cell state
    MOV r6, r0
    MUL r6, r9
    ADD r6, r1
    ADD r6, r10
    LOAD r4, r6      ; r4 = current state
    
    ; Apply Day & Night rules
    CMP r4, r7
    JZ r0, was_alive
    
    ; Was dead: check birth mask
    MOV r5, r26      ; birth_mask
    MOV r6, r7
    SHL r6, r3       ; 1 << count
    AND r5, r6
    JNZ r5, set_alive
    JMP set_dead
    
was_alive:
    ; Was alive: check survival mask
    MOV r5, r27      ; survival_mask
    MOV r6, r7
    SHL r6, r3       ; 1 << count
    AND r5, r6
    JNZ r5, set_alive
    JMP set_dead
    
set_alive:
    LDI r4, 1
    JMP store_next
set_dead:
    LDI r4, 0
    
store_next:
    MOV r6, r0
    MUL r6, r9
    ADD r6, r1
    ADD r6, r11      ; next_grid
    STORE r6, r4
    
    ; Draw cell
    MOV r13, r1
    MUL r13, r12
    MOV r14, r0
    MUL r14, r12
    
    CMP r4, r7
    JZ r0, draw_on
    
    ; OFF -> black
    LDI r15, 0x000000
    JMP do_rect
    
draw_on:
    ; ON -> check if stable (survived with 3,4,6,7,8 neighbors)
    CMP r3, r7
    JZ r0, draw_white   ; 1 neighbor = unstable
    LDI r6, 2
    CMP r3, r6
    JZ r0, draw_white   ; 2 neighbors = unstable
    
    ; 3,4,6,7,8 = stable -> green tint
    LDI r15, 0x00FF88
    JMP do_rect
    
draw_white:
    LDI r15, 0xFFFFFF
    
do_rect:
    RECTF r13, r14, r12, r12, r15
    
    ADD r1, r7
    CMP r1, r9
    JNZ r1, update_x
    ADD r0, r7
    CMP r0, r9
    JNZ r0, update_y

    ; Swap grids
    MOV r4, r10
    MOV r10, r11
    MOV r11, r4

    FRAME
    JMP main_loop

; ===== Helper: check cell at (r0, r1) =====
check_cell:
    PUSH r31
    MOV r15, r0
    MOV r16, r1
    LDI r17, 0x3F
    AND r15, r17
    AND r16, r17
    MOV r6, r15
    MUL r6, r9
    ADD r6, r16
    ADD r6, r10
    LOAD r4, r6
    ADD r3, r4
    POP r31
    RET
