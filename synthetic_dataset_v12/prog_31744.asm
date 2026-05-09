; DESCRIPTION: Draws a green rectangle at (270, 53) with width 89 and height 117.
; PLAN: r0=270(x), r1=53(y), r2=89(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 53
LDI r2, 89
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
