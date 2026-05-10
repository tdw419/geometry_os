; DESCRIPTION: Draws a purple rectangle at (11, 42) with width 32 and height 75.
; PLAN: r0=11(x), r1=42(y), r2=32(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 42
LDI r2, 32
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
