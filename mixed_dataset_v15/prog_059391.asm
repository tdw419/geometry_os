; DESCRIPTION: Draws a yellow rectangle at (23, 119) with width 102 and height 25.
; PLAN: r0=23(x), r1=119(y), r2=102(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 119
LDI r2, 102
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
