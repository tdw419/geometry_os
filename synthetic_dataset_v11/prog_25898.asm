; DESCRIPTION: Draws a yellow rectangle at (196, 123) with width 13 and height 49.
; PLAN: r0=196(x), r1=123(y), r2=13(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 123
LDI r2, 13
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
