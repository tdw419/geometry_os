; DESCRIPTION: Creates a green rectangular region at (367, 56) spanning 119 by 120 pixels.
; PLAN: r0=367(x), r1=56(y), r2=119(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 56
LDI r2, 119
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
