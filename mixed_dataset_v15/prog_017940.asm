; DESCRIPTION: Draws a yellow rectangle at (310, 8) with width 79 and height 62.
; PLAN: r0=310(x), r1=8(y), r2=79(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 8
LDI r2, 79
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
