; DESCRIPTION: Creates a purple rectangular region at (192, 137) spanning 96 by 22 pixels.
; PLAN: r0=192(x), r1=137(y), r2=96(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 137
LDI r2, 96
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
