; DESCRIPTION: Creates a purple rectangular region at (8, 31) spanning 119 by 83 pixels.
; PLAN: r0=8(x), r1=31(y), r2=119(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 31
LDI r2, 119
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
