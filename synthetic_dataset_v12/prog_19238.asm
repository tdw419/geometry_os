; DESCRIPTION: Draws a green rectangle at (94, 26) with width 109 and height 83.
; PLAN: r0=94(x), r1=26(y), r2=109(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 26
LDI r2, 109
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
