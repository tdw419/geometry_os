; DESCRIPTION: Creates a black rectangular region at (31, 100) spanning 11 by 116 pixels.
; PLAN: r0=31(x), r1=100(y), r2=11(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 100
LDI r2, 11
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
