; DESCRIPTION: Draws a purple rectangle at (16, 36) with width 85 and height 63.
; PLAN: r0=16(x), r1=36(y), r2=85(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 36
LDI r2, 85
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
