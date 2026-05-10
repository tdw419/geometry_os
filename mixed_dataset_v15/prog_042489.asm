; DESCRIPTION: Draws a green rectangle at (260, 73) with width 79 and height 44.
; PLAN: r0=260(x), r1=73(y), r2=79(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 73
LDI r2, 79
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
