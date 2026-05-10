; DESCRIPTION: Draws a yellow rectangle at (316, 38) with width 31 and height 12.
; PLAN: r0=316(x), r1=38(y), r2=31(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 38
LDI r2, 31
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
