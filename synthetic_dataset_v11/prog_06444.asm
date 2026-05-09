; DESCRIPTION: Creates a green rectangular region at (49, 105) spanning 33 by 100 pixels.
; PLAN: r0=49(x), r1=105(y), r2=33(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 105
LDI r2, 33
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
