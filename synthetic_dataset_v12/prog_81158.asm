; DESCRIPTION: Creates a green rectangular region at (83, 112) spanning 22 by 74 pixels.
; PLAN: r0=83(x), r1=112(y), r2=22(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 112
LDI r2, 22
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
