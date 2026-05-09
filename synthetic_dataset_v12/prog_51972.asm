; DESCRIPTION: Draws a red rectangle at (381, 132) with width 118 and height 107.
; PLAN: r0=381(x), r1=132(y), r2=118(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 132
LDI r2, 118
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
