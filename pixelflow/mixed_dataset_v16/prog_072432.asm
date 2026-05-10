; DESCRIPTION: Draws a black rectangle at (363, 86) with width 89 and height 118.
; PLAN: r0=363(x), r1=86(y), r2=89(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 86
LDI r2, 89
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
