; DESCRIPTION: Draws a green rectangle at (134, 192) with width 30 and height 62.
; PLAN: r0=134(x), r1=192(y), r2=30(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 192
LDI r2, 30
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
