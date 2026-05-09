; DESCRIPTION: Places a black 64x19 rectangle at position (224, 89).
; PLAN: r0=224(x), r1=89(y), r2=64(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 89
LDI r2, 64
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
