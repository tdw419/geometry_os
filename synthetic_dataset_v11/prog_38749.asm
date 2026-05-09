; DESCRIPTION: Creates a green rectangular region at (75, 192) spanning 119 by 45 pixels.
; PLAN: r0=75(x), r1=192(y), r2=119(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 192
LDI r2, 119
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
