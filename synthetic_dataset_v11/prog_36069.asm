; DESCRIPTION: Draws a yellow rectangle at (65, 162) with width 104 and height 17.
; PLAN: r0=65(x), r1=162(y), r2=104(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 162
LDI r2, 104
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
