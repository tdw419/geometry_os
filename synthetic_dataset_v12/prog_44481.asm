; DESCRIPTION: Draws a yellow rectangle at (230, 76) with width 46 and height 84.
; PLAN: r0=230(x), r1=76(y), r2=46(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 76
LDI r2, 46
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
