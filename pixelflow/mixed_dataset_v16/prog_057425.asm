; DESCRIPTION: Draws a yellow rectangle at (81, 200) with width 81 and height 10.
; PLAN: r0=81(x), r1=200(y), r2=81(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 200
LDI r2, 81
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
