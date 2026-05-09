; DESCRIPTION: Draws a purple rectangle at (107, 39) with width 87 and height 109.
; PLAN: r0=107(x), r1=39(y), r2=87(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 39
LDI r2, 87
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
