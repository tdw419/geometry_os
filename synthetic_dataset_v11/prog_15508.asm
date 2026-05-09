; DESCRIPTION: Creates a black rectangular region at (124, 121) spanning 14 by 88 pixels.
; PLAN: r0=124(x), r1=121(y), r2=14(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 121
LDI r2, 14
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
