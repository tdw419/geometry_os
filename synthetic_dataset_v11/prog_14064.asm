; DESCRIPTION: Creates a black rectangular region at (103, 119) spanning 66 by 118 pixels.
; PLAN: r0=103(x), r1=119(y), r2=66(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 119
LDI r2, 66
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
