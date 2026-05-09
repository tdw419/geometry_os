; DESCRIPTION: Creates a purple rectangular region at (142, 135) spanning 31 by 30 pixels.
; PLAN: r0=142(x), r1=135(y), r2=31(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 135
LDI r2, 31
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
