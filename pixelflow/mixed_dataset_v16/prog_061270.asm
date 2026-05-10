; DESCRIPTION: Draws a yellow rectangle at (341, 74) with width 119 and height 20.
; PLAN: r0=341(x), r1=74(y), r2=119(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 74
LDI r2, 119
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
