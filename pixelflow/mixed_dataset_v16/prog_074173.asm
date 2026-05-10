; DESCRIPTION: Creates a black rectangular region at (58, 158) spanning 66 by 37 pixels.
; PLAN: r0=58(x), r1=158(y), r2=66(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 158
LDI r2, 66
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
