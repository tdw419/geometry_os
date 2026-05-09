; DESCRIPTION: Draws a green rectangle at (10, 139) with width 51 and height 86.
; PLAN: r0=10(x), r1=139(y), r2=51(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 139
LDI r2, 51
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
