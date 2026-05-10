; DESCRIPTION: Creates a green rectangular region at (270, 106) spanning 28 by 83 pixels.
; PLAN: r0=270(x), r1=106(y), r2=28(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 106
LDI r2, 28
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
