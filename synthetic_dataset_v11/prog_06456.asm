; DESCRIPTION: Creates a green rectangular region at (139, 97) spanning 26 by 81 pixels.
; PLAN: r0=139(x), r1=97(y), r2=26(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 97
LDI r2, 26
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
