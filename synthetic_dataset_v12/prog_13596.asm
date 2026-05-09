; DESCRIPTION: Creates a black rectangular region at (104, 122) spanning 112 by 116 pixels.
; PLAN: r0=104(x), r1=122(y), r2=112(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 122
LDI r2, 112
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
