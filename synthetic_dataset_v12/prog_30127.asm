; DESCRIPTION: Draws a green rectangle at (249, 89) with width 57 and height 37.
; PLAN: r0=249(x), r1=89(y), r2=57(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 89
LDI r2, 57
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
