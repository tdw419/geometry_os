; DESCRIPTION: Creates a black rectangular region at (31, 157) spanning 116 by 24 pixels.
; PLAN: r0=31(x), r1=157(y), r2=116(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 157
LDI r2, 116
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
