; DESCRIPTION: Draws a green rectangle at (390, 190) with width 56 and height 38.
; PLAN: r0=390(x), r1=190(y), r2=56(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 190
LDI r2, 56
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
