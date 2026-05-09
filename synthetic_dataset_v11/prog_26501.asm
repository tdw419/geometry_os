; DESCRIPTION: Creates a yellow rectangular region at (200, 45) spanning 26 by 66 pixels.
; PLAN: r0=200(x), r1=45(y), r2=26(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 45
LDI r2, 26
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
