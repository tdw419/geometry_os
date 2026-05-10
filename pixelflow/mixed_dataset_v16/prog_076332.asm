; DESCRIPTION: Draws a blue rectangle at (417, 137) with width 26 and height 29.
; PLAN: r0=417(x), r1=137(y), r2=26(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 137
LDI r2, 26
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
