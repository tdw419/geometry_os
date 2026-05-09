; DESCRIPTION: Draws a yellow rectangle at (86, 104) with width 78 and height 120.
; PLAN: r0=86(x), r1=104(y), r2=78(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 104
LDI r2, 78
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
