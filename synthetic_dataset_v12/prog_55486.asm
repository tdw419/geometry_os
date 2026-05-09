; DESCRIPTION: Draws a green rectangle at (261, 11) with width 101 and height 11.
; PLAN: r0=261(x), r1=11(y), r2=101(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 11
LDI r2, 101
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
