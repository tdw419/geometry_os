; DESCRIPTION: Creates a black rectangular region at (88, 1) spanning 88 by 38 pixels.
; PLAN: r0=88(x), r1=1(y), r2=88(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 1
LDI r2, 88
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
