; DESCRIPTION: Draws a green rectangle at (118, 205) with width 49 and height 51.
; PLAN: r0=118(x), r1=205(y), r2=49(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 205
LDI r2, 49
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
