; DESCRIPTION: Creates a blue rectangular region at (93, 101) spanning 110 by 102 pixels.
; PLAN: r0=93(x), r1=101(y), r2=110(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 101
LDI r2, 110
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
