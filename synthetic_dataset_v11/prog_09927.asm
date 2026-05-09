; DESCRIPTION: Creates a green rectangular region at (45, 172) spanning 31 by 23 pixels.
; PLAN: r0=45(x), r1=172(y), r2=31(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 172
LDI r2, 31
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
