; DESCRIPTION: Draws a green rectangle at (79, 98) with width 62 and height 119.
; PLAN: r0=79(x), r1=98(y), r2=62(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 98
LDI r2, 62
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
