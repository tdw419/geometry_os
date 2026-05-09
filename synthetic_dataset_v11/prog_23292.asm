; DESCRIPTION: Draws a yellow rectangle at (156, 81) with width 55 and height 90.
; PLAN: r0=156(x), r1=81(y), r2=55(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 81
LDI r2, 55
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
