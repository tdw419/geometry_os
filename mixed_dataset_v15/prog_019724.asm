; DESCRIPTION: Draws a purple rectangle at (219, 52) with width 86 and height 42.
; PLAN: r0=219(x), r1=52(y), r2=86(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 52
LDI r2, 86
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
