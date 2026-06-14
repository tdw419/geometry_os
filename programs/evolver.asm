; evolver.asm -- Grid-resident evolutionary loop (Phase V)
;
; Manages a population of 4 individuals (XOR candidate circuits)
; Evaluates, selects (Tournament), and Mutates using Substrate MMIO.
;
; Population layout (Origin):
;   Idx 0: (64, 64)   Idx 1: (96, 64)
;   Idx 2: (64, 96)   Idx 3: (96, 96)
;   Each slot is 32x32 pixels.
;
; Registers:
;   r1: Gen counter
;   r2: Current indiv index (0-3)
;   r3-r6: Fitness scores
;   r10: PRNG State
;   r11: Best score
;   r12: Best idx
;   r13: Worst score
;   r14: Worst idx
;
; Substrate MMIO:
;   0xE000: SUB_X, 0xE001: SUB_Y, 0xE004: SUB_CMD
;   0xE005: SUB_ARG1, 0xE006: SUB_ARG2, 0xE007: SUB_STATUS
;   Cmds: 0x01: TICK, 0x08: COPY, 0x09: PATCH

#define POP_SIZE 4
#define GEN_SIZE 32
#define MAX_GEN 100

#define SUB_X 0xE000
#define SUB_Y 0xE001
#define SUB_INJECT 0xE002
#define SUB_READ 0xE003
#define SUB_CMD 0xE004
#define SUB_ARG1 0xE005
#define SUB_ARG2 0xE006
#define SUB_STATUS 0xE007
#define SUB_RESULT 0xE008

#define CMD_TICK 1
#define CMD_COPY 8
#define CMD_PATCH 9

#define TAX_SIGNAL 12
#define TAX_WIRE 14
#define DIR_DOWN 1
#define DIR_RIGHT 0

:main
    LDI r10, 0x1234 ; Seed PRNG
    LDI r1, 0       ; Gen = 0

:gen_loop
    LDI r2, 0       ; Eval loop index

:eval_loop
    ; Compute origin for individual r2
    ; x = 64 + (r2 % 2) * 32
    ; y = 64 + (r2 / 2) * 32
    MOV r7, r2
    LDI r8, 2
    MOD r7, r8      ; r7 = r2 % 2
    LDI r8, 32
    MUL r7, r8
    LDI r8, 64
    ADD r7, r8      ; r7 = origin_x
    
    MOV r9, r2
    LDI r8, 2
    DIV r9, r8      ; r9 = r2 / 2
    LDI r8, 32
    MUL r9, r8
    LDI r8, 64
    ADD r9, r8      ; r9 = origin_y

    ; --- Evaluate XOR(0, 1) ---
    ; Clear signals (just one tick or manual patch) - Skip for POC
    
    ; Inject Input A (1, 1) = pulse
    LDI r15, 1
    ADD r15, r7
    LDI r16, SUB_X
    STORE r16, r15
    LDI r15, 1
    ADD r15, r9
    LDI r16, SUB_Y
    STORE r16, r15
    
    LDI r15, TAX_SIGNAL
    LDI r16, 28
    SHL r15, r16
    LDI r16, DIR_DOWN
    LDI r17, 24
    SHL r16, r17
    OR r15, r16
    LDI r16, 0xFFFFFF ; White signal
    OR r15, r16
    LDI r16, SUB_INJECT
    STORE r16, r15

    ; Tick substrate
    LDI r16, SUB_CMD
    LDI r15, CMD_TICK
    STORE r16, r15
    LDI r16, SUB_ARG1
    LDI r15, 32
    STORE r16, r15
    
:wait_tick
    LDI r16, SUB_STATUS
    LOAD r15, r16
    CMPI r15, 2
    JNZ r0, :wait_tick

    ; Read output at (14, 13)
    LDI r15, 14
    ADD r15, r7
    LDI r16, SUB_X
    STORE r16, r15
    LDI r15, 13
    ADD r15, r9
    LDI r16, SUB_Y
    STORE r16, r15
    LDI r16, SUB_READ
    LOAD r15, r16
    
    ; If result > 0, increment fitness
    JZ r15, :next_eval
    
    ; r3 + r2 is fitness reg
    LDI r8, 3
    ADD r8, r2
    ; INC fitness
    LOAD r15, r8
    ADDI r15, 1
    STORE r8, r15

:next_eval
    ADDI r2, 1
    CMPI r2, POP_SIZE
    JNZ r0, :eval_loop

:selection
    ; tournament: find best and worst
    LDI r11, 0 ; best score
    LDI r12, 0 ; best idx
    LDI r13, 255 ; worst score
    LDI r14, 0 ; worst idx
    
    LDI r2, 0
:select_loop
    LDI r8, 3
    ADD r8, r2
    LOAD r15, r8 ; current score
    
    ; check best
    CMP r15, r11
    BLT r0, :not_best
    MOV r11, r15
    MOV r12, r2
:not_best
    ; check worst
    CMP r15, r13
    BGE r0, :not_worst
    MOV r13, r15
    MOV r14, r2
:not_worst
    ADDI r2, 1
    CMPI r2, POP_SIZE
    JNZ r0, :select_loop

:reproduction
    ; COPY from Best (r12) to Worst (r14)
    ; Compute source origin (r12)
    MOV r7, r12
    LDI r8, 2
    MOD r7, r8      ; r7 = r12 % 2 (col)
    LDI r8, 32
    MUL r7, r8
    LDI r8, 64
    ADD r7, r8      ; r7 = src_x
    
    MOV r9, r12
    LDI r8, 2
    DIV r9, r8      ; r9 = r12 / 2 (row)
    LDI r8, 32
    MUL r9, r8
    LDI r8, 64
    ADD r9, r8      ; r9 = src_y

    ; Compute dest origin (r14)
    MOV r15, r14
    LDI r8, 2
    MOD r15, r8     ; r15 = r14 % 2
    LDI r8, 32
    MUL r15, r8
    LDI r8, 64
    ADD r15, r8     ; r15 = dst_x
    
    MOV r17, r14
    LDI r8, 2
    DIV r17, r8     ; r17 = r14 / 2
    LDI r8, 32
    MUL r17, r8
    LDI r8, 64
    ADD r17, r8     ; r17 = dst_y

    ; Setup COPY: src_x, src_y in ARG1/ARG2
    LDI r16, SUB_ARG1
    LDI r8, 0xFFFF
    AND r7, r8
    AND r9, r8
    LDI r8, 16
    SHL r7, r8
    OR r7, r9
    STORE r16, r7   ; ARG1 = src_x << 16 | src_y

    LDI r16, SUB_ARG2
    LDI r8, 32
    LDI r18, 16
    SHL r8, r18
    LDI r18, 32
    OR r8, r18
    STORE r16, r8   ; ARG2 = 32 << 16 | 32 (size)

    ; dst_x, dst_y in SUB_X, SUB_Y
    LDI r16, SUB_X
    STORE r16, r15
    LDI r16, SUB_Y
    STORE r16, r17

    LDI r16, SUB_CMD
    LDI r8, CMD_COPY
    STORE r16, r8

:wait_copy
    LDI r16, SUB_STATUS
    LOAD r8, r16
    CMPI r8, 2
    JNZ r0, :wait_copy

:mutation
    ; PRNG Mutation on the Worst individual (r14)
    ; r10 = seed
    LDI r8, 1103515245
    MUL r10, r8
    LDI r8, 12345
    ADD r10, r8     ; r10 = next PRNG state

    ; rand_x = (r10 >> 16) % 32
    MOV r17, r10
    LDI r8, 16
    SAR r17, r8
    LDI r8, 32
    MOD r17, r8
    ADD r17, r15     ; r17 = dst_x + rand_x

    ; rand_y = (r10 >> 8) % 32
    MOV r18, r10
    LDI r8, 8
    SAR r18, r8
    LDI r8, 32
    MOD r18, r8
    ADD r18, r9      ; r18 = dst_y + rand_y

    ; rand_type = (r10 % 3) + 1 (PRUNE, WIRE, REINFORCE)
    MOV r19, r10
    LDI r8, 3
    MOD r19, r8
    ADDI r19, 1      ; r19 = task type

    ; Dispatch patch
    LDI r16, SUB_X
    STORE r16, r17
    LDI r16, SUB_Y
    STORE r16, r18
    
    LDI r8, 0
    CMPI r19, 1
    JZ r0, :do_patch_val ; PRUNE (0)
    LDI r8, 0xE000FF00   ; WIRE
    CMPI r19, 2
    JZ r0, :do_patch_val
    LDI r8, 0x12345678   ; LOGIC (dummy)

:do_patch_val
    LDI r16, SUB_ARG1
    STORE r16, r8
    LDI r16, SUB_CMD
    LDI r8, CMD_PATCH
    STORE r16, r8

:wait_patch
    LDI r16, SUB_STATUS
    LOAD r8, r16
    CMPI r8, 2
    JNZ r0, :wait_patch
    
    ADDI r1, 1
    CMPI r1, MAX_GEN
    JNZ r0, :gen_loop
    
    HALT
