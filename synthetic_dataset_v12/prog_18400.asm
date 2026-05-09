; DESCRIPTION: Draws a green rectangle at (312, 9) with width 59 and height 117.
; PLAN: r0=312(x), r1=9(y), r2=59(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 9
LDI r2, 59
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
