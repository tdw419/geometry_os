; DESCRIPTION: Creates a green rectangular region at (145, 38) spanning 22 by 66 pixels.
; PLAN: r0=145(x), r1=38(y), r2=22(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 38
LDI r2, 22
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
