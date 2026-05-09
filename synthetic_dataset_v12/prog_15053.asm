; DESCRIPTION: Draws a yellow rectangle at (156, 17) with width 80 and height 104.
; PLAN: r0=156(x), r1=17(y), r2=80(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 17
LDI r2, 80
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
