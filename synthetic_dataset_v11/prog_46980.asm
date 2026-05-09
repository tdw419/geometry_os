; DESCRIPTION: Creates a black rectangular region at (116, 35) spanning 10 by 97 pixels.
; PLAN: r0=116(x), r1=35(y), r2=10(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 35
LDI r2, 10
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
