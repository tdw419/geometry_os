; DESCRIPTION: Creates a black rectangular region at (200, 87) spanning 110 by 112 pixels.
; PLAN: r0=200(x), r1=87(y), r2=110(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 87
LDI r2, 110
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
