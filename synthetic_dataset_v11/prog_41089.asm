; DESCRIPTION: Draws a yellow rectangle at (40, 103) with width 80 and height 29.
; PLAN: r0=40(x), r1=103(y), r2=80(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 103
LDI r2, 80
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
