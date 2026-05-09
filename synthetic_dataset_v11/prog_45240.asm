; DESCRIPTION: Draws a purple rectangle at (63, 42) with width 70 and height 116.
; PLAN: r0=63(x), r1=42(y), r2=70(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 42
LDI r2, 70
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
