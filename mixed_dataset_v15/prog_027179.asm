; DESCRIPTION: Draws a yellow rectangle at (47, 77) with width 117 and height 19.
; PLAN: r0=47(x), r1=77(y), r2=117(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 77
LDI r2, 117
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
