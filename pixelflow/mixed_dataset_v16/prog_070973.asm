; DESCRIPTION: Draws a green rectangle at (390, 73) with width 83 and height 58.
; PLAN: r0=390(x), r1=73(y), r2=83(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 73
LDI r2, 83
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
