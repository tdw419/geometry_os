; DESCRIPTION: Draws a green rectangle at (44, 4) with width 87 and height 100.
; PLAN: r0=44(x), r1=4(y), r2=87(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 4
LDI r2, 87
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
