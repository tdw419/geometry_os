; DESCRIPTION: Creates a yellow rectangular region at (110, 105) spanning 11 by 76 pixels.
; PLAN: r0=110(x), r1=105(y), r2=11(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 105
LDI r2, 11
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
