; DESCRIPTION: Creates a black rectangular region at (107, 101) spanning 38 by 116 pixels.
; PLAN: r0=107(x), r1=101(y), r2=38(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 101
LDI r2, 38
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
