; DESCRIPTION: Places a orange 64x52 rectangle at position (71, 5).
; PLAN: r0=71(x), r1=5(y), r2=64(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 5
LDI r2, 64
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
