; DESCRIPTION: Creates a yellow rectangular region at (47, 49) spanning 76 by 73 pixels.
; PLAN: r0=47(x), r1=49(y), r2=76(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 49
LDI r2, 76
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
