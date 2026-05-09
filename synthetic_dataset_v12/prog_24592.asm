; DESCRIPTION: Draws a yellow rectangle at (24, 153) with width 101 and height 48.
; PLAN: r0=24(x), r1=153(y), r2=101(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 153
LDI r2, 101
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
