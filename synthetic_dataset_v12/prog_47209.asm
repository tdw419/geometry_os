; DESCRIPTION: Draws a yellow rectangle at (399, 7) with width 102 and height 37.
; PLAN: r0=399(x), r1=7(y), r2=102(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 7
LDI r2, 102
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
