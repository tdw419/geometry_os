; DESCRIPTION: Draws a yellow rectangle at (407, 60) with width 81 and height 44.
; PLAN: r0=407(x), r1=60(y), r2=81(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 60
LDI r2, 81
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
