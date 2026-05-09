; DESCRIPTION: Creates a green rectangular region at (367, 56) spanning 88 by 38 pixels.
; PLAN: r0=367(x), r1=56(y), r2=88(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 56
LDI r2, 88
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
