; DESCRIPTION: Draws a yellow rectangle at (27, 158) with width 14 and height 96.
; PLAN: r0=27(x), r1=158(y), r2=14(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 158
LDI r2, 14
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
