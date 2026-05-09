; DESCRIPTION: Creates a black rectangular region at (73, 116) spanning 15 by 49 pixels.
; PLAN: r0=73(x), r1=116(y), r2=15(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 116
LDI r2, 15
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
