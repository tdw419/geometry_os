; DESCRIPTION: Creates a green rectangular region at (99, 123) spanning 69 by 106 pixels.
; PLAN: r0=99(x), r1=123(y), r2=69(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 123
LDI r2, 69
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
