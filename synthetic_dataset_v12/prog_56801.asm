; DESCRIPTION: Creates a black rectangular region at (179, 140) spanning 119 by 68 pixels.
; PLAN: r0=179(x), r1=140(y), r2=119(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 119
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
