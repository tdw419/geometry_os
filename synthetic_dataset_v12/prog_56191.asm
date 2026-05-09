; DESCRIPTION: Creates a black rectangular region at (312, 15) spanning 81 by 72 pixels.
; PLAN: r0=312(x), r1=15(y), r2=81(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 15
LDI r2, 81
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
