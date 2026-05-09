; DESCRIPTION: Draws a yellow rectangle at (107, 104) with width 108 and height 88.
; PLAN: r0=107(x), r1=104(y), r2=108(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 104
LDI r2, 108
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
