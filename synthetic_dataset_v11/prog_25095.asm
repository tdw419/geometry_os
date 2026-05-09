; DESCRIPTION: Creates a yellow rectangular region at (83, 157) spanning 22 by 95 pixels.
; PLAN: r0=83(x), r1=157(y), r2=22(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 22
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
