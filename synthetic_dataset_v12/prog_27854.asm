; DESCRIPTION: Draws a yellow rectangle at (91, 101) with width 10 and height 75.
; PLAN: r0=91(x), r1=101(y), r2=10(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 101
LDI r2, 10
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
