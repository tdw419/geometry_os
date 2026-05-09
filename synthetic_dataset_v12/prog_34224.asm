; DESCRIPTION: Creates a black rectangular region at (73, 69) spanning 101 by 85 pixels.
; PLAN: r0=73(x), r1=69(y), r2=101(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 69
LDI r2, 101
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
