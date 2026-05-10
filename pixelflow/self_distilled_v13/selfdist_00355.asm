; DESCRIPTION: Draws a yellow rectangle at (393, 127) with width 119 and height 104.
; PLAN: r0=393(x), r1=127(y), r2=119(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 127
LDI r2, 119
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
