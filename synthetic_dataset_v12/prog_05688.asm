; DESCRIPTION: Draws a purple rectangle at (107, 85) with width 109 and height 63.
; PLAN: r0=107(x), r1=85(y), r2=109(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 85
LDI r2, 109
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
