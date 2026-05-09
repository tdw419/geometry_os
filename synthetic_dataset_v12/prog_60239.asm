; DESCRIPTION: Draws a green rectangle at (437, 161) with width 52 and height 66.
; PLAN: r0=437(x), r1=161(y), r2=52(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 161
LDI r2, 52
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
