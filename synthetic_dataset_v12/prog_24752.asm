; DESCRIPTION: Creates a purple rectangular region at (64, 71) spanning 105 by 110 pixels.
; PLAN: r0=64(x), r1=71(y), r2=105(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 71
LDI r2, 105
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
