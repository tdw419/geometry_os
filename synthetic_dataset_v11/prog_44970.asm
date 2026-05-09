; DESCRIPTION: Draws a yellow rectangle at (167, 99) with width 56 and height 49.
; PLAN: r0=167(x), r1=99(y), r2=56(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 99
LDI r2, 56
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
