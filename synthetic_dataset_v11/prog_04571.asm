; DESCRIPTION: Creates a green rectangular region at (229, 88) spanning 10 by 48 pixels.
; PLAN: r0=229(x), r1=88(y), r2=10(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 88
LDI r2, 10
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
