; DESCRIPTION: Draws a black rectangle at (81, 199) with width 10 and height 54.
; PLAN: r0=81(x), r1=199(y), r2=10(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 199
LDI r2, 10
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
