; DESCRIPTION: Draws a yellow rectangle at (251, 104) with width 78 and height 40.
; PLAN: r0=251(x), r1=104(y), r2=78(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 104
LDI r2, 78
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
