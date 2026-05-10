; DESCRIPTION: Creates a green rectangular region at (330, 110) spanning 10 by 96 pixels.
; PLAN: r0=330(x), r1=110(y), r2=10(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 110
LDI r2, 10
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
