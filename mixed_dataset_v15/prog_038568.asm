; DESCRIPTION: Draws a yellow rectangle at (192, 103) with width 18 and height 100.
; PLAN: r0=192(x), r1=103(y), r2=18(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 103
LDI r2, 18
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
