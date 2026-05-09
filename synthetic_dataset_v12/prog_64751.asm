; DESCRIPTION: Creates a green rectangular region at (367, 56) spanning 92 by 119 pixels.
; PLAN: r0=367(x), r1=56(y), r2=92(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 56
LDI r2, 92
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
