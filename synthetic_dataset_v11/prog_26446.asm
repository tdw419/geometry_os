; DESCRIPTION: Draws a yellow rectangle at (81, 96) with width 103 and height 49.
; PLAN: r0=81(x), r1=96(y), r2=103(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 96
LDI r2, 103
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
