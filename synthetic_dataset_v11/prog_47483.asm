; DESCRIPTION: Creates a black rectangular region at (55, 58) spanning 119 by 33 pixels.
; PLAN: r0=55(x), r1=58(y), r2=119(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 58
LDI r2, 119
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
