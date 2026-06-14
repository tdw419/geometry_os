; evolver_v3_xor.asm -- Phase 38: XOR Stress Test
; Target: XOR gate (0,0)->0, (0,1)->1, (1,0)->1, (1,1)->0
; Population: 8 individuals in 2x4 grid starting at (32, 64)

:start
    LDI r1, 0          ; Gen = 0
    LDI r30, 0x1234    ; Seed PRNG

    ; --- Substrate IO Setup ---
    LDI r25, 0xE000    ; SUB_X
    LDI r26, 0xE001    ; SUB_Y
    LDI r27, 0xE002    ; SUB_INJECT
    LDI r28, 0xE003    ; SUB_READBACK
    LDI r29, 0xE004    ; SUB_CMD (Ticks)

    ; --- Initial Injection (Random Junk) ---
    LDI r2, 0
:init_pop_loop
    CALL get_sector_coords ; Sets r15=X, r16=Y
    
    LDI r3, 15         ; 15 random cells for XOR complexity
:init_cell_loop
    CALL prng
    MOV r17, r30
    ANDI r17, 15       ; x (0..15)
    MOV r18, r30
    SHRI r18, 4
    ANDI r18, 15       ; y (0..15)
    
    MOV r19, r15
    ADD r19, r17       ; Final X
    MOV r20, r16
    ADD r20, r18       ; Final Y
    
    STORE r25, r19
    STORE r26, r20
    
    CALL prng
    MOV r21, r30
    ANDI r21, 3        ; 0..3
    
    ; Taxonomy: 0=Empty, 1=Logic(AND), 2=Logic(OR), 3=Wire
    CMPI r21, 1
    JZ r0, :init_and
    CMPI r21, 2
    JZ r0, :init_or
    CMPI r21, 3
    JZ r0, :init_wire
    LDI r19, 0         ; Empty
    JMP :init_apply
:init_and
    LDI r19, 1         ; Logic
    SHLI r19, 28
    LDI r21, 1         ; AND type
    SHLI r21, 24
    OR r19, r21
    ORI r19, 0xFF0000  ; Red for Logic
    JMP :init_apply
:init_or
    LDI r19, 1         ; Logic
    SHLI r19, 28
    LDI r21, 2         ; OR type
    SHLI r21, 24
    OR r19, r21
    ORI r19, 0xFFFF00  ; Yellow for OR
    JMP :init_apply
:init_wire
    LDI r19, 14        ; Wire
    SHLI r19, 28
    ORI r19, 0x0000FF  ; Blue for Wire
:init_apply
    STORE r27, r19
    
    SUBI r3, 1
    CMPI r3, 0
    BGE r0, :init_cell_loop
    
    ADDI r2, 1
    CMPI r2, 8
    BLT r0, :init_pop_loop

:gen_loop
    ; --- Evaluation ---
    LDI r2, 0          ; Start evaluating population (0..7)
:eval_loop
    CALL get_sector_coords ; Sets r15=X, r16=Y
    
    LDI r22, 0         ; Total Fitness for this individual (0..4)
    
    LDI r23, 0         ; Case Index (0..3)
:case_loop
    ; Input A at (X+1, Y+1)
    MOV r17, r15
    ADDI r17, 1
    STORE r25, r17
    MOV r18, r16
    ADDI r18, 1
    STORE r26, r18
    LDI r19, 0         ; Low
    MOV r20, r23
    ANDI r20, 2        ; Bit 1 of case (InA)
    JZ r0, :inject_a
    LDI r19, 12        ; Signal
    SHLI r19, 28
    ORI r19, 0x00FF00  ; Green Signal
:inject_a
    STORE r27, r19

    ; Input B at (X+1, Y+14)
    MOV r17, r15
    ADDI r17, 1
    STORE r25, r17
    MOV r18, r16
    ADDI r18, 14
    STORE r26, r18
    LDI r19, 0         ; Low
    MOV r20, r23
    ANDI r20, 1        ; Bit 0 of case (InB)
    JZ r0, :inject_b
    LDI r19, 12        ; Signal
    SHLI r19, 28
    ORI r19, 0x00FF00  ; Green Signal
:inject_b
    STORE r27, r19

    ; Tick 64 times
    LDI r20, 64
    LDI r21, 0xE005
    STORE r21, r20
    LDI r20, 1
    STORE r29, r20
    
    ; Read back at (X+14, Y+7)
    MOV r17, r15
    ADDI r17, 14
    STORE r25, r17
    MOV r18, r16
    ADDI r18, 7
    STORE r26, r18
    LOAD r21, r28      ; Read result
    
    ; Evaluate Case
    MOV r24, r21
    SHRI r24, 28
    LDI r20, 0         ; IsHigh = 0
    CMPI r24, 12
    JZ r0, :set_high
    CMPI r24, 15
    JZ r0, :set_high
    JMP :check_case
:set_high
    LDI r20, 1
    
:check_case
    ; Target: XOR Gate
    ; Case 0 (0,0) -> 0
    ; Case 1 (0,1) -> 1
    ; Case 2 (1,0) -> 1
    ; Case 3 (1,1) -> 0
    
    CMPI r23, 0        ; Case 0 (0,0)
    JZ r0, :expect_low
    CMPI r23, 3        ; Case 3 (1,1)
    JZ r0, :expect_low
    
:expect_high
    CMPI r20, 1
    JZ r0, :inc_fitness
    JMP :case_done
    
:expect_low
    CMPI r20, 0
    JZ r0, :inc_fitness
    JMP :case_done

:inc_fitness
    ADDI r22, 1

:case_done
    ADDI r23, 1
    CMPI r23, 4
    BLT r0, :case_loop

    ; Store fitness
    LDI r17, 0x8000
    ADD r17, r2
    STORE r17, r22

    ADDI r2, 1
    CMPI r2, 8
    BLT r0, :eval_loop

    ; --- Selection ---
    LDI r13, 0         ; Best Score
    LDI r11, 0         ; Best Index
    LDI r2, 0
:select_loop
    LDI r17, 0x8000
    ADD r17, r2
    LOAD r18, r17
    CMP r18, r13
    BLT r0, :not_best
    MOV r13, r18
    MOV r11, r2
:not_best
    ADDI r2, 1
    CMPI r2, 8
    BLT r0, :select_loop

    ; --- Reproduction & Mutation ---
    LDI r2, 0
:repr_loop
    CMP r2, r11
    JZ r0, :repr_skip
    
    ; Copy Best to child
    MOV r10, r2 ; save child index
    MOV r2, r11
    CALL get_sector_coords
    MOV r3, r15 ; Best X
    MOV r4, r16 ; Best Y
    MOV r2, r10 ; restore child index
    CALL get_sector_coords
    MOV r5, r15 ; Child X
    MOV r6, r16 ; Child Y
    
    ; CMD_COPY arg1: sx << 24 | sy << 16 | dx << 8 | dy
    MOV r19, r3
    SHLI r19, 8
    OR r19, r4
    SHLI r19, 8
    OR r19, r5
    SHLI r19, 8
    OR r19, r6
    LDI r20, 0xE005
    STORE r20, r19
    LDI r21, 0x00100010 ; 16x16
    LDI r22, 0xE006
    STORE r22, r21
    LDI r23, 8
    STORE r29, r23

    ; Mutate Child
    LDI r7, 6          ; 6 mutations for XOR complexity
:mut_child_loop
    CALL prng
    MOV r17, r30
    ANDI r17, 15       ; x
    MOV r18, r30
    SHRI r18, 4
    ANDI r18, 15       ; y
    
    MOV r19, r15
    ADD r19, r17
    MOV r20, r16
    ADD r20, r18
    STORE r25, r19
    STORE r26, r20
    
    CALL prng
    MOV r21, r30
    SHRI r21, 8
    ANDI r21, 3
    
    CMPI r21, 1
    JZ r0, :m_and
    CMPI r21, 2
    JZ r0, :m_or
    CMPI r21, 3
    JZ r0, :m_wire
    LDI r19, 0
    JMP :m_apply
:m_and
    LDI r19, 0x11000000 ; Logic AND
    ORI r19, 0xFF0000
    JMP :m_apply
:m_or
    LDI r19, 0x12000000 ; Logic OR
    ORI r19, 0xFFFF00
    JMP :m_apply
:m_wire
    LDI r19, 0xE00000FF ; Wire
:m_apply
    STORE r27, r19
    
    SUBI r7, 1
    CMPI r7, 0
    BGE r0, :mut_child_loop

:repr_skip
    ADDI r2, 1
    CMPI r2, 8
    BLT r0, :repr_loop

    ; --- Gen Loop ---
    ADDI r1, 1
    CMPI r1, 1000
    BLT r0, :gen_loop

    ; Signal Completion
    LDI r10, 10
    STORE r25, r10
    LDI r11, 10
    STORE r26, r11
    LDI r12, 14
    SHLI r12, 28
    ORI r12, 0x00FF00FF
    STORE r27, r12
    HALT

; --- Helpers ---

:get_sector_coords
    ; r2 = index (0..7) -> r15=X, r16=Y
    MOV r15, r2
    ANDI r15, 3        ; Col 0..3
    MOV r16, r2
    SHRI r16, 2        ; Row 0..1
    
    LDI r17, 32
    MUL r15, r17
    ADDI r15, 32       ; X = 32 + col*32
    MUL r16, r17
    ADDI r16, 64       ; Y = 64 + row*32
    RET

:prng
    MOV r24, r30
    MOV r0, r24
    SHLI r0, 13
    XOR r24, r0
    MOV r0, r24
    SHRI r0, 17
    XOR r24, r0
    MOV r0, r24
    SHLI r0, 5
    XOR r24, r0
    MOV r30, r24
    RET
