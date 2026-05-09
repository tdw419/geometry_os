; DESCRIPTION: Draws a green rectangle at (144, 19) with width 57 and height 94.
; PLAN: r0=144(x), r1=19(y), r2=57(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 19
LDI r2, 57
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
