; DESCRIPTION: Creates a blue rectangular region at (77, 19) spanning 110 by 30 pixels.
; PLAN: r0=77(x), r1=19(y), r2=110(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 19
LDI r2, 110
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
