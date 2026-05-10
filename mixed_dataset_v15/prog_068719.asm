; DESCRIPTION: Draws a yellow rectangle at (222, 134) with width 38 and height 97.
; PLAN: r0=222(x), r1=134(y), r2=38(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 134
LDI r2, 38
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
