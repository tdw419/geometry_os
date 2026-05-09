; DESCRIPTION: Creates a purple rectangular region at (13, 143) spanning 34 by 110 pixels.
; PLAN: r0=13(x), r1=143(y), r2=34(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 143
LDI r2, 34
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
