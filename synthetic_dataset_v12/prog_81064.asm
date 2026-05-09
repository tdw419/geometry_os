; DESCRIPTION: Draws a green rectangle at (62, 142) with width 26 and height 87.
; PLAN: r0=62(x), r1=142(y), r2=26(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 142
LDI r2, 26
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
