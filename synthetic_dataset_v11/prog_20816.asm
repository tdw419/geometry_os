; DESCRIPTION: Creates a yellow rectangular region at (119, 43) spanning 49 by 79 pixels.
; PLAN: r0=119(x), r1=43(y), r2=49(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 43
LDI r2, 49
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
