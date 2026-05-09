; DESCRIPTION: Creates a black rectangular region at (58, 3) spanning 102 by 100 pixels.
; PLAN: r0=58(x), r1=3(y), r2=102(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 3
LDI r2, 102
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
