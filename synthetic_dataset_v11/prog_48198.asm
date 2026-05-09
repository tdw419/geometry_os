; DESCRIPTION: Creates a black rectangular region at (53, 233) spanning 88 by 23 pixels.
; PLAN: r0=53(x), r1=233(y), r2=88(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 233
LDI r2, 88
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
