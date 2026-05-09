; DESCRIPTION: Creates a purple rectangular region at (89, 144) spanning 19 by 83 pixels.
; PLAN: r0=89(x), r1=144(y), r2=19(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 144
LDI r2, 19
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
