; DESCRIPTION: Creates a blue rectangular region at (244, 22) spanning 23 by 75 pixels.
; PLAN: r0=244(x), r1=22(y), r2=23(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 22
LDI r2, 23
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
