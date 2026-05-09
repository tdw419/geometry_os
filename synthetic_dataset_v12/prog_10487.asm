; DESCRIPTION: Draws a purple rectangle at (105, 107) with width 95 and height 72.
; PLAN: r0=105(x), r1=107(y), r2=95(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 107
LDI r2, 95
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
