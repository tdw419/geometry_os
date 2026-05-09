; DESCRIPTION: Draws a green rectangle at (122, 8) with width 90 and height 73.
; PLAN: r0=122(x), r1=8(y), r2=90(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 8
LDI r2, 90
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
