; DESCRIPTION: Creates a green rectangular region at (402, 31) spanning 87 by 55 pixels.
; PLAN: r0=402(x), r1=31(y), r2=87(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 31
LDI r2, 87
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
