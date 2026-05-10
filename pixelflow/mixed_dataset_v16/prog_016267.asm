; DESCRIPTION: Creates a black rectangular region at (253, 101) spanning 116 by 56 pixels.
; PLAN: r0=253(x), r1=101(y), r2=116(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 101
LDI r2, 116
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
