; DESCRIPTION: Creates a purple rectangular region at (96, 141) spanning 31 by 15 pixels.
; PLAN: r0=96(x), r1=141(y), r2=31(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 141
LDI r2, 31
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
