; DESCRIPTION: Creates a green rectangular region at (423, 137) spanning 28 by 75 pixels.
; PLAN: r0=423(x), r1=137(y), r2=28(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 137
LDI r2, 28
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
