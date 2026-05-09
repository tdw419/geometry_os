; DESCRIPTION: Draws a green rectangle at (150, 122) with width 89 and height 102.
; PLAN: r0=150(x), r1=122(y), r2=89(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 122
LDI r2, 89
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
