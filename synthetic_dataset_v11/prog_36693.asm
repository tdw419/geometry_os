; DESCRIPTION: Creates a black rectangular region at (58, 38) spanning 78 by 112 pixels.
; PLAN: r0=58(x), r1=38(y), r2=78(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 38
LDI r2, 78
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
