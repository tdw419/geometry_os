; DESCRIPTION: Draws a green rectangle at (87, 217) with width 36 and height 22.
; PLAN: r0=87(x), r1=217(y), r2=36(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 217
LDI r2, 36
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
