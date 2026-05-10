; DESCRIPTION: Draws a green rectangle at (8, 66) with width 76 and height 62.
; PLAN: r0=8(x), r1=66(y), r2=76(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 66
LDI r2, 76
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
