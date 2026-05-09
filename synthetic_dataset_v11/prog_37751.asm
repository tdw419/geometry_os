; DESCRIPTION: Creates a green rectangular region at (110, 138) spanning 109 by 100 pixels.
; PLAN: r0=110(x), r1=138(y), r2=109(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 138
LDI r2, 109
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
