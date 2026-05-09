; DESCRIPTION: Creates a purple rectangular region at (100, 20) spanning 64 by 119 pixels.
; PLAN: r0=100(x), r1=20(y), r2=64(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 20
LDI r2, 64
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
