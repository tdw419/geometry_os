; DESCRIPTION: Draws a yellow rectangle at (163, 196) with width 110 and height 18.
; PLAN: r0=163(x), r1=196(y), r2=110(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 196
LDI r2, 110
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
