; Neural Importance Evaluator v2
; Evaluates whether a data fragment is important enough to migrate
; Green = important, Red = skip

main:
    LDI r1, 100         ; Input: sample data value
    LDI r2, weights
    NEURAL_EVAL r3, r1, r2

    ; Check if result >= 128 (important)
    LDI r4, 128
    SUB r5, r3, r4
    JZ r5, migrate      ; Exactly 128 -> migrate

    ; If r5 > 0 (r3 was > 128), also migrate
    ; (SUB stores result in r5; if positive, r3 was larger)
    JNZ r5, migrate

    ; Otherwise skip (red screen)
    LDI r0, 0xFF0000
    FILL r0
    FRAME
    HALT

migrate:
    LDI r0, 0x00FF00    ; Green = important
    FILL r0
    FRAME
    HALT

weights:
    .byte 0x7F, 0xF6, 0x00, 0x00
