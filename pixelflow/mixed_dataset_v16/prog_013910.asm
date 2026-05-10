; DESCRIPTION: Creates a yellow rectangular region at (4, 20) spanning 119 by 102 pixels.
; PLAN: r0=4(x), r1=20(y), r2=119(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 20
LDI r2, 119
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
