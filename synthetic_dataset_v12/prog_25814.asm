; DESCRIPTION: Creates a yellow rectangular region at (76, 4) spanning 118 by 105 pixels.
; PLAN: r0=76(x), r1=4(y), r2=118(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 4
LDI r2, 118
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
