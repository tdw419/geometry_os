; DESCRIPTION: Creates a green rectangular region at (31, 152) spanning 63 by 88 pixels.
; PLAN: r0=31(x), r1=152(y), r2=63(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 152
LDI r2, 63
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
