; DESCRIPTION: Creates a purple rectangular region at (5, 157) spanning 73 by 49 pixels.
; PLAN: r0=5(x), r1=157(y), r2=73(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 157
LDI r2, 73
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
