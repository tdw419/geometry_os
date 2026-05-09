; DESCRIPTION: Creates a yellow rectangular region at (343, 101) spanning 53 by 55 pixels.
; PLAN: r0=343(x), r1=101(y), r2=53(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 101
LDI r2, 53
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
