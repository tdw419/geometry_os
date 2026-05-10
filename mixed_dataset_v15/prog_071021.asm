; DESCRIPTION: Creates a black rectangular region at (15, 73) spanning 78 by 85 pixels.
; PLAN: r0=15(x), r1=73(y), r2=78(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 73
LDI r2, 78
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
