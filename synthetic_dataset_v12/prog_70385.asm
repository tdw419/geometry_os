; DESCRIPTION: Draws a green rectangle at (118, 31) with width 105 and height 117.
; PLAN: r0=118(x), r1=31(y), r2=105(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 31
LDI r2, 105
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
