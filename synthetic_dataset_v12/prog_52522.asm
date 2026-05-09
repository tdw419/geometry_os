; DESCRIPTION: Creates a purple rectangular region at (46, 3) spanning 31 by 110 pixels.
; PLAN: r0=46(x), r1=3(y), r2=31(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 3
LDI r2, 31
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
