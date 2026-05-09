; DESCRIPTION: Draws a yellow rectangle at (51, 108) with width 38 and height 91.
; PLAN: r0=51(x), r1=108(y), r2=38(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 108
LDI r2, 38
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
