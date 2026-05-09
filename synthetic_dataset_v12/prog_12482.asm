; DESCRIPTION: Draws a red rectangle at (222, 185) with width 15 and height 66.
; PLAN: r0=222(x), r1=185(y), r2=15(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 185
LDI r2, 15
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
