; DESCRIPTION: Creates a black rectangular region at (66, 60) spanning 101 by 76 pixels.
; PLAN: r0=66(x), r1=60(y), r2=101(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 60
LDI r2, 101
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
