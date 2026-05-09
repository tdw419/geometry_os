; DESCRIPTION: Creates a purple rectangular region at (31, 58) spanning 73 by 52 pixels.
; PLAN: r0=31(x), r1=58(y), r2=73(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 58
LDI r2, 73
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
