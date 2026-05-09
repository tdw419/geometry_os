; DESCRIPTION: Draws a yellow rectangle at (204, 104) with width 24 and height 18.
; PLAN: r0=204(x), r1=104(y), r2=24(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 104
LDI r2, 24
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
