; DESCRIPTION: Draws a yellow rectangle at (62, 175) with width 101 and height 16.
; PLAN: r0=62(x), r1=175(y), r2=101(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 175
LDI r2, 101
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
