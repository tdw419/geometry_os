; DESCRIPTION: Draws a green rectangle at (26, 175) with width 87 and height 28.
; PLAN: r0=26(x), r1=175(y), r2=87(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 175
LDI r2, 87
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
