; DESCRIPTION: Draws a red rectangle at (390, 80) with width 51 and height 19.
; PLAN: r0=390(x), r1=80(y), r2=51(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 80
LDI r2, 51
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
