; DESCRIPTION: Creates a green rectangular region at (137, 88) spanning 80 by 109 pixels.
; PLAN: r0=137(x), r1=88(y), r2=80(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 88
LDI r2, 80
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
