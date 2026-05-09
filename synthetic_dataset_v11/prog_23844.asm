; DESCRIPTION: Creates a green rectangular region at (138, 65) spanning 118 by 33 pixels.
; PLAN: r0=138(x), r1=65(y), r2=118(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 65
LDI r2, 118
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
