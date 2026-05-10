; DESCRIPTION: Creates a purple rectangular region at (332, 38) spanning 58 by 57 pixels.
; PLAN: r0=332(x), r1=38(y), r2=58(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 38
LDI r2, 58
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
