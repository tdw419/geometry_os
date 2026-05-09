; DESCRIPTION: Creates a green rectangular region at (395, 77) spanning 107 by 100 pixels.
; PLAN: r0=395(x), r1=77(y), r2=107(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 77
LDI r2, 107
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
