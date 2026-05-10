; DESCRIPTION: Draws a green rectangle at (261, 43) with width 90 and height 87.
; PLAN: r0=261(x), r1=43(y), r2=90(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 43
LDI r2, 90
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
