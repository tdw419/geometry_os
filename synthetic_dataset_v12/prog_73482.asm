; DESCRIPTION: Creates a green rectangular region at (7, 83) spanning 45 by 22 pixels.
; PLAN: r0=7(x), r1=83(y), r2=45(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 83
LDI r2, 45
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
