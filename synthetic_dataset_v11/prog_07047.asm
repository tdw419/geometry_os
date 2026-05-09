; DESCRIPTION: Creates a green rectangular region at (100, 140) spanning 33 by 35 pixels.
; PLAN: r0=100(x), r1=140(y), r2=33(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 140
LDI r2, 33
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
