; DESCRIPTION: Draws a yellow rectangle at (86, 90) with width 89 and height 45.
; PLAN: r0=86(x), r1=90(y), r2=89(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 90
LDI r2, 89
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
