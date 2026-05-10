; DESCRIPTION: Draws a yellow rectangle at (316, 94) with width 16 and height 30.
; PLAN: r0=316(x), r1=94(y), r2=16(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 94
LDI r2, 16
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
