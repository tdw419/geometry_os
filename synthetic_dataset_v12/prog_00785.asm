; DESCRIPTION: Creates a green rectangular region at (157, 45) spanning 11 by 106 pixels.
; PLAN: r0=157(x), r1=45(y), r2=11(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 45
LDI r2, 11
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
