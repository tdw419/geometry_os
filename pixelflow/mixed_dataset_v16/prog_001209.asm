; DESCRIPTION: Draws a red rectangle at (17, 8) with width 119 and height 46.
; PLAN: r0=17(x), r1=8(y), r2=119(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 8
LDI r2, 119
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
