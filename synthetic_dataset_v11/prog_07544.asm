; DESCRIPTION: Draws a yellow rectangle at (125, 80) with width 107 and height 106.
; PLAN: r0=125(x), r1=80(y), r2=107(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 80
LDI r2, 107
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
