; DESCRIPTION: Creates a green rectangular region at (15, 112) spanning 99 by 33 pixels.
; PLAN: r0=15(x), r1=112(y), r2=99(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 112
LDI r2, 99
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
