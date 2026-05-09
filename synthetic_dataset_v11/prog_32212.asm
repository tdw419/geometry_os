; DESCRIPTION: Creates a green rectangular region at (5, 91) spanning 73 by 100 pixels.
; PLAN: r0=5(x), r1=91(y), r2=73(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 91
LDI r2, 73
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
