; DESCRIPTION: Creates a black rectangular region at (258, 101) spanning 79 by 73 pixels.
; PLAN: r0=258(x), r1=101(y), r2=79(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 101
LDI r2, 79
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
