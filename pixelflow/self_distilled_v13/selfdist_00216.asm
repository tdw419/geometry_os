; DESCRIPTION: Draws a green rectangle at (230, 122) with width 63 and height 85.
; PLAN: r0=230(x), r1=122(y), r2=63(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 122
LDI r2, 63
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
