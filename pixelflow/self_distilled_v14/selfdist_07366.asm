; DESCRIPTION: Draws a yellow rectangle at (208, 6) with width 46 and height 55.
; PLAN: r0=208(x), r1=6(y), r2=46(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 6
LDI r2, 46
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
