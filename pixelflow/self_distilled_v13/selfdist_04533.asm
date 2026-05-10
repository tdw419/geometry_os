; DESCRIPTION: Draws a purple rectangle at (350, 179) with width 82 and height 107.
; PLAN: r0=350(x), r1=179(y), r2=82(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 179
LDI r2, 82
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
