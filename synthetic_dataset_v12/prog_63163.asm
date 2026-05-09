; DESCRIPTION: Creates a yellow rectangular region at (423, 1) spanning 83 by 105 pixels.
; PLAN: r0=423(x), r1=1(y), r2=83(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 1
LDI r2, 83
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
