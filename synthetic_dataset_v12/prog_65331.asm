; DESCRIPTION: Draws a purple rectangle at (399, 68) with width 42 and height 115.
; PLAN: r0=399(x), r1=68(y), r2=42(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 68
LDI r2, 42
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
