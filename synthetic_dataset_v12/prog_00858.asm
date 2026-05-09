; DESCRIPTION: Draws a red rectangle at (17, 24) with width 15 and height 51.
; PLAN: r0=17(x), r1=24(y), r2=15(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 24
LDI r2, 15
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
