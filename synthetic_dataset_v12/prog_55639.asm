; DESCRIPTION: Creates a blue rectangular region at (93, 102) spanning 31 by 51 pixels.
; PLAN: r0=93(x), r1=102(y), r2=31(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 102
LDI r2, 31
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
