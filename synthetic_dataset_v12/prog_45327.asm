; DESCRIPTION: Creates a green rectangular region at (100, 105) spanning 23 by 76 pixels.
; PLAN: r0=100(x), r1=105(y), r2=23(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 105
LDI r2, 23
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
