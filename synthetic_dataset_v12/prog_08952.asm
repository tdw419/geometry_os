; DESCRIPTION: Creates a black rectangular region at (427, 118) spanning 62 by 91 pixels.
; PLAN: r0=427(x), r1=118(y), r2=62(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 118
LDI r2, 62
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
