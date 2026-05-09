; DESCRIPTION: Draws a green rectangle at (278, 161) with width 80 and height 66.
; PLAN: r0=278(x), r1=161(y), r2=80(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 161
LDI r2, 80
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
