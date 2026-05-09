; DESCRIPTION: Creates a yellow rectangular region at (137, 100) spanning 83 by 76 pixels.
; PLAN: r0=137(x), r1=100(y), r2=83(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 100
LDI r2, 83
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
