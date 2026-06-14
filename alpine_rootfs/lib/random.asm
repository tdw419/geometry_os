; lib/random.asm -- Standard Library: pseudo-random number generation
;
; Version: 1.2.0
; Dependencies: none (base library)
; Clobbers: varies per function (see individual docs)
;
; Calling convention:
;   Arguments: r1-r5 (r0 = return value)
;   Caller-saved: r1-r9
;   Callee-saved: r10-r25
;
; Uses xorshift32 PRNG with seed stored in RAM.
; Seed initialized from tick counter on first use.
;
; Memory:
;   0xFC0 = PRNG seed (u32, initialized lazily from ticks)
;   0xFC4 = PRNG initialized flag (0 = not init, 1 = init)

#define PRNG_SEED 0xFC0
#define PRNG_INIT 0xFC4

; ═══════════════════════════════════════════════════════════════
; rng_init -- initialize PRNG seed from tick counter
;   r1 = seed (optional, 0 = use tick counter)
;   clobbers: r2, r9
; ═══════════════════════════════════════════════════════════════
rng_init:
    LDI r9, PRNG_INIT
    JNZ r1, rng_init_custom
    ; Use tick counter as seed
    LDI r9, 0xFFE
    LOAD r0, r9
    JNZ r0, rng_init_have_seed
    LDI r0, 12345           ; fallback seed
rng_init_have_seed:
    LDI r9, PRNG_SEED
    STORE r9, r0
    LDI r9, PRNG_INIT
    LDI r0, 1
    STORE r9, r0
    RET
rng_init_custom:
    ; Use provided seed
    LDI r9, PRNG_SEED
    STORE r9, r1
    LDI r9, PRNG_INIT
    LDI r0, 1
    STORE r9, r0
    LDI r0, 0              ; return value
    RET

; ═══════════════════════════════════════════════════════════════
; _rng_ensure_init -- lazy initialization (internal)
;   clobbers: r1, r2, r9
; ═══════════════════════════════════════════════════════════════
_rng_ensure_init:
    LDI r9, PRNG_INIT
    LOAD r0, r9
    JNZ r0, _rng_ei_done
    LDI r1, 0               ; use tick counter
    CALL rng_init
_rng_ei_done:
    RET

; ═══════════════════════════════════════════════════════════════
; rng_next -- generate next 32-bit random number
;   returns r0 = random u32
;   clobbers: r1, r2, r3, r9
;
;   Algorithm: xorshift32
;     x ^= x << 13
;     x ^= x >> 17
;     x ^= x << 5
; ═══════════════════════════════════════════════════════════════
rng_next:
    CALL _rng_ensure_init
    LDI r9, PRNG_SEED
    LOAD r0, r9             ; r0 = x

    ; x ^= x << 13
    MOV r1, r0
    LDI r2, 13
    SHL r1, r2
    XOR r0, r1

    ; x ^= x >> 17
    MOV r1, r0
    LDI r2, 17
    SHR r1, r2
    XOR r0, r1

    ; x ^= x << 5
    MOV r1, r0
    LDI r2, 5
    SHL r1, r2
    XOR r0, r1

    ; Store new seed
    LDI r9, PRNG_SEED
    STORE r9, r0
    RET

; ═══════════════════════════════════════════════════════════════
; rng_range -- random number in [0, max)
;   r1 = max (exclusive upper bound)
;   returns r0 = random value in [0, max)
;   clobbers: r2, r3, r9
;
;   Uses modular reduction: result = rng_next() % max
;   For small max values this has acceptable uniformity.
; ═══════════════════════════════════════════════════════════════
rng_range:
    MOV r10, r1             ; save max in callee-saved register (rng_next clobbers r1)
    CALL rng_next            ; r0 = random u32
    MOV r2, r0              ; save random value
    JZ r10, rng_range_zero  ; max == 0 -> return 0
    MOD r2, r10             ; r2 = random % max (use saved max)
    MOV r0, r2
    RET
rng_range_zero:
    LDI r0, 0
    RET

; ═══════════════════════════════════════════════════════════════
; rng_range_bounded -- random number in [min, max]
;   r1 = min (inclusive), r2 = max (inclusive)
;   returns r0 = random value in [min, max]
;   clobbers: r3, r4, r9
;
;   result = min + rng_next() % (max - min + 1)
; ═══════════════════════════════════════════════════════════════
rng_range_bounded:
    MOV r10, r1             ; save min in callee-saved register (rng_next clobbers r1)
    ; range = max - min + 1
    MOV r3, r2
    SUB r3, r1             ; r3 = max - min
    LDI r4, 1
    ADD r3, r4             ; r3 = max - min + 1
    JZ r3, rng_rb_exact    ; range == 0 -> min == max
    ; result = min + rng_next() % range
    MOV r4, r3             ; save range (r4 not clobbered by rng_next)
    CALL rng_next
    MOD r0, r4             ; r0 = rng % range
    ADD r0, r10            ; r0 = min + result (use saved min)
    RET
rng_rb_exact:
    MOV r0, r1             ; return min (== max)
    RET

; ═══════════════════════════════════════════════════════════════
; rng_coin -- random boolean (0 or 1)
;   returns r0 = 0 or 1
;   clobbers: r1
; ═══════════════════════════════════════════════════════════════
rng_coin:
    CALL rng_next
    LDI r1, 2
    MOD r0, r1
    RET
