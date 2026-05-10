; DESCRIPTION: Draws a green rectangle at (177, 83) with width 55 and height 81.
; PLAN: r0=177(x), r1=83(y), r2=55(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 83
LDI r2, 55
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
