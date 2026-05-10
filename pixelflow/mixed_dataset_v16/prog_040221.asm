; DESCRIPTION: Creates a black rectangular region at (53, 218) spanning 58 by 15 pixels.
; PLAN: r0=53(x), r1=218(y), r2=58(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 218
LDI r2, 58
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
