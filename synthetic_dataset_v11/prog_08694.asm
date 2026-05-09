; DESCRIPTION: Draws a yellow rectangle at (232, 103) with width 24 and height 56.
; PLAN: r0=232(x), r1=103(y), r2=24(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 103
LDI r2, 24
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
