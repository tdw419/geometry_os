; DESCRIPTION: Draws a yellow rectangle at (86, 18) with width 95 and height 104.
; PLAN: r0=86(x), r1=18(y), r2=95(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 18
LDI r2, 95
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
