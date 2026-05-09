; DESCRIPTION: Creates a green rectangular region at (26, 200) spanning 86 by 35 pixels.
; PLAN: r0=26(x), r1=200(y), r2=86(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 200
LDI r2, 86
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
