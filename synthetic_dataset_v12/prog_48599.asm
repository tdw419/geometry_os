; DESCRIPTION: Creates a green rectangular region at (356, 33) spanning 119 by 52 pixels.
; PLAN: r0=356(x), r1=33(y), r2=119(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 33
LDI r2, 119
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
