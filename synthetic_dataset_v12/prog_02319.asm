; DESCRIPTION: Draws a green rectangle at (94, 4) with width 37 and height 90.
; PLAN: r0=94(x), r1=4(y), r2=37(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 4
LDI r2, 37
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
