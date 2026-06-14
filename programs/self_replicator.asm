; self_replicator.asm -- Cascading Gray Goo Replicator
;
; Fix: Uses SHLI/ORI to build 32-bit immediates for MMIO.

    LDI r1, 0       ; Current X
    LDI r2, 0       ; Current Gen
    LDI r10, 4      ; Max Generations

:gen_loop
    ; --- 1. SUBSTRATE_COPY(X, 0) -> (X+32, 0) ---
    ; arg1 = (X << 24) | ((X+32) << 8)
    
    MOV r3, r1
    SHLI r3, 24     ; sx << 24
    
    LDI r4, 32
    ADD r4, r1      ; next_x
    MOV r21, r4     ; save next_x for later
    
    SHLI r4, 8      ; dx << 8
    OR r3, r4       ; r3 = (sx<<24) | (dx<<8)
    
    LDI r20, 0xE005
    STORE r20, r3
    
    ; arg2 = (16 << 16) | 16 = 0x00100010
    LDI r3, 16
    SHLI r3, 16
    ORI r3, 16      ; r3 = 0x00100010
    LDI r20, 0xE006
    STORE r20, r3
    
    LDI r3, 8       ; COPY
    LDI r20, 0xE004
    STORE r20, r3

    ; --- 2. Signal Offspring ---
    MOV r3, r21
    ADDI r3, 5      ; next_x + 5
    LDI r20, 0xE000 ; X
    STORE r20, r3
    
    LDI r3, 5
    LDI r20, 0xE001 ; Y
    STORE r20, r3
    
    ; Signal = 12 << 28 = 0xC0000000
    LDI r3, 12
    SHLI r3, 28     ; r3 = 0xC0000000
    LDI r20, 0xE002 ; Inject
    STORE r20, r3

    ; --- 3. Advance substrate ---
    LDI r3, 50
    LDI r20, 0xE005 ; arg1 = 50
    STORE r20, r3
    LDI r3, 1       ; command = TICK
    LDI r20, 0xE004
    STORE r20, r3

    ; --- 4. Next Generation ---
    MOV r1, r21     ; X = next_x
    ADDI r2, 1      ; Gen++
    
    LDI r3, 4
    CMP r2, r3
    LDI r20, :gen_loop
    JNZ r0, r20     ; r0 is -1 if r2 < 4

    HALT
