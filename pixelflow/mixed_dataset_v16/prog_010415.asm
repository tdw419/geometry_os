; DESCRIPTION: Creates a yellow rectangular region at (232, 92) spanning 53 by 105 pixels.
; PLAN: r0=232(x), r1=92(y), r2=53(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 92
LDI r2, 53
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
