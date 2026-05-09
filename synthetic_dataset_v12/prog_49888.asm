; DESCRIPTION: Draws a yellow rectangle at (261, 81) with width 84 and height 61.
; PLAN: r0=261(x), r1=81(y), r2=84(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 81
LDI r2, 84
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
