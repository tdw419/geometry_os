; DESCRIPTION: Draws a yellow rectangle at (239, 119) with width 51 and height 117.
; PLAN: r0=239(x), r1=119(y), r2=51(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 119
LDI r2, 51
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
