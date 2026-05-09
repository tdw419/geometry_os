; DESCRIPTION: Creates a green rectangular region at (252, 110) spanning 64 by 65 pixels.
; PLAN: r0=252(x), r1=110(y), r2=64(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 110
LDI r2, 64
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
