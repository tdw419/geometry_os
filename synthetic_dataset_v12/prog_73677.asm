; DESCRIPTION: Creates a green rectangular region at (379, 24) spanning 78 by 88 pixels.
; PLAN: r0=379(x), r1=24(y), r2=78(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 24
LDI r2, 78
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
