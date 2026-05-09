; DESCRIPTION: Creates a green rectangular region at (256, 174) spanning 110 by 34 pixels.
; PLAN: r0=256(x), r1=174(y), r2=110(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 174
LDI r2, 110
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
