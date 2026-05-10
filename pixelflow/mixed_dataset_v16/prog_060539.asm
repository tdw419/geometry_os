; DESCRIPTION: Draws a blue rectangle at (190, 101) with width 89 and height 65.
; PLAN: r0=190(x), r1=101(y), r2=89(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 101
LDI r2, 89
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
