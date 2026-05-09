; DESCRIPTION: Draws a yellow rectangle at (318, 140) with width 19 and height 72.
; PLAN: r0=318(x), r1=140(y), r2=19(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 140
LDI r2, 19
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
