; DESCRIPTION: Creates a purple rectangular region at (438, 22) spanning 66 by 31 pixels.
; PLAN: r0=438(x), r1=22(y), r2=66(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 22
LDI r2, 66
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
