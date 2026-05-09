; DESCRIPTION: Creates a green rectangular region at (154, 57) spanning 119 by 88 pixels.
; PLAN: r0=154(x), r1=57(y), r2=119(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 57
LDI r2, 119
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
