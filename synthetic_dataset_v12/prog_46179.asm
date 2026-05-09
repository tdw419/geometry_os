; DESCRIPTION: Draws a yellow rectangle at (129, 6) with width 75 and height 18.
; PLAN: r0=129(x), r1=6(y), r2=75(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 6
LDI r2, 75
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
