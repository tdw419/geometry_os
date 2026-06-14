; evolver_v2.asm -- Phase 36: Rich Fitness Landscape
; Evolves an AND gate Truth Table (0..4 score)
; Population: 8 individuals
; Generations: 100

:start
    LDI r1, 0          ; Gen = 0
    LDI r30, 0x1234    ; Seed PRNG

:gen_loop
    ; --- 1. Clear All Sectors ---
    ; For simplicity, we could just clear the whole evolution region
    ; (64, 150) to (64 + 8*32, 150 + 32)
    ; But maybe it's better to clear individually if we want to preserve state?
    ; Evolution usually replaces the worst with the best, so we only need to clear the child.
    ; For now, let's stick to the current logic: reproduction clears/copies, then mutation.

    LDI r2, 0          ; Start evaluating population (0..7)

:eval_loop
    ; Base Coordinates
    LDI r15, 32
    MUL r15, r2
    ADDI r15, 64       ; r15 = Sector X
    LDI r16, 150       ; r16 = Sector Y
    
    LDI r22, 0         ; Total Fitness for this individual (0..4)
    
    ; --- Truth Table Loop (4 cases) ---
    ; Case 0: InA=0, InB=0 -> Exp=0
    ; Case 1: InA=0, InB=1 -> Exp=0
    ; Case 2: InA=1, InB=0 -> Exp=0
    ; Case 3: InA=1, InB=1 -> Exp=1
    
    LDI r23, 0         ; Case Index (0..3)
:case_loop
    ; Substrate IO Setup
    LDI r25, 0xE000    ; SUB_X
    LDI r26, 0xE001    ; SUB_Y
    LDI r27, 0xE002    ; SUB_INJECT
    LDI r28, 0xE003    ; SUB_READBACK
    LDI r29, 0xE004    ; SUB_CMD (Ticks)

    ; Clear internal signals (Tick with no inputs?) 
    ; Or just rely on the fact that we wait enough time.
    ; Better: Reset signals if possible.
    
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
    JZ r20, :inject_a
    LDI r19, 0xC000FF00 ; High
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
    JZ r20, :inject_b
    LDI r19, 0xC000FF00 ; High
:inject_b
    STORE r27, r19

    ; Tick 32 times (longer for path depth)
    LDI r20, 32
    LDI r21, 0xE005    ; SUB_ARG1
    STORE r21, r20
    LDI r20, 1         ; CMD_TICK
    STORE r29, r20
    
    ; Read back at (X+14, Y+7) -- Middle-ish output
    MOV r17, r15
    ADDI r17, 14
    STORE r25, r17
    MOV r18, r16
    ADDI r18, 7
    STORE r26, r18
    LOAD r21, r28      ; Read result
    
    ; Evaluate Case
    CMPI r23, 3        ; Is it Case 3 (1,1)?
    JZ r0, :expect_high
    
:expect_low
    CMPI r21, 100
    BLT r0, :low_ok
    JMP :case_done
:low_ok
    ADDI r22, 1        ; Correct (Stayed low)
    JMP :case_done

:expect_high
    CMPI r21, 100
    BGE r0, :high_ok
    JMP :case_done
:high_ok
    ADDI r22, 1        ; Correct (Went high)

:case_done
    ADDI r23, 1
    CMPI r23, 4
    BLT r0, :case_loop

    ; Store fitness for individual r2
    ; (Need a memory region or use registers r3-r10)
    ; Let's use RAM 0x8000 + r2 for fitness
    LDI r15, 0x8000
    ADD r15, r2
    STORE r15, r22

    ADDI r2, 1
    CMPI r2, 8
    BLT r0, :eval_loop

    ; --- Selection & Reproduction ---
    ; Find Best (r11) and Worst (r12)
    LDI r13, 0         ; Best Score
    LDI r14, 5         ; Worst Score
    LDI r2, 0
:select_loop
    LDI r15, 0x8000
    ADD r15, r2
    LOAD r16, r15      ; Score
    
    CMP r16, r13
    BLT r0, :not_best
    MOV r13, r16
    MOV r11, r2
:not_best
    CMP r16, r14
    BGE r0, :not_worst
    MOV r14, r16
    MOV r12, r2
:not_worst
    ADDI r2, 1
    CMPI r2, 8
    BLT r0, :select_loop

    ; Copy Best to Worst
    LDI r15, 32
    MOV r16, r11
    MUL r16, r15
    ADDI r16, 64       ; sx
    MOV r17, r12
    MUL r17, r15
    ADDI r17, 64       ; dx
    LDI r18, 150       ; sy/dy
    
    MOV r19, r16
    SHLI r19, 8
    OR r19, r18
    SHLI r19, 8
    OR r19, r17
    SHLI r19, 8
    OR r19, r18
    LDI r20, 0xE005    ; SUB_ARG1
    STORE r20, r19
    LDI r21, 0x00100010 ; 16x16
    LDI r22, 0xE006    ; SUB_ARG2
    STORE r22, r21
    LDI r23, 8          ; CMD_COPY
    STORE r29, r23

    ; Mutation on the child (Worst)
    ; Xorshift PRNG
    MOV r15, r30
    MOV r16, r15
    SHLI r16, 13
    XOR r15, r16
    MOV r16, r15
    SHRI r16, 17
    XOR r15, r16
    MOV r16, r15
    SHLI r16, 5
    XOR r15, r16
    MOV r30, r15
    
    ; Random Cell in Sector
    MOV r16, r30
    ANDI r16, 15  ; mut_x (0..15)
    MOV r17, r30
    SHRI r17, 4
    ANDI r17, 15  ; mut_y (0..15)
    
    LDI r15, 32
    MOV r18, r12
    MUL r18, r15
    ADDI r18, 64  ; Sector X
    ADD r18, r16  ; Final X
    LDI r19, 150
    ADD r19, r17  ; Final Y
    
    STORE r25, r18
    STORE r26, r19
    
    ; Random Taxonomy (Wire=12, OR=14, Empty=0)
    MOV r21, r30
    SHRI r21, 8
    ANDI r21, 3   ; 0..3
    
    CMPI r21, 0
    JZ r0, :mut_empty
    CMPI r21, 1
    JZ r0, :mut_wire
    CMPI r21, 2
    JZ r0, :mut_gate
    
    ; Default to Wire
:mut_wire
    LDI r20, 12        ; Wire
    JMP :apply_mut
:mut_gate
    LDI r20, 14        ; OR Gate
    JMP :apply_mut
:mut_empty
    LDI r20, 0         ; Empty
    
:apply_mut
    SHLI r20, 28
    ORI r20, 0xFF      ; Add color (Blue for visibility)
    STORE r27, r20

    ; --- Loop ---
    ADDI r1, 1
    CMPI r1, 100
    BLT r0, :gen_loop

    ; --- Finalize: Signal Completion ---
    ; Draw a green marker at (10,10)
    LDI r10, 10
    STORE r25, r10
    LDI r11, 10
    STORE r26, r11
    LDI r12, 12        ; Wire
    SHLI r12, 28
    ORI r12, 0x00FF00FF ; Green Marker
    STORE r27, r12

    HALT
