; DESCRIPTION: Draws a yellow rectangle at (259, 121) with width 119 and height 87.
; PLAN: r0=259(x), r1=121(y), r2=119(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 121
LDI r2, 119
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
