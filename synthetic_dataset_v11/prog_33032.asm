; DESCRIPTION: Creates a purple rectangular region at (93, 18) spanning 31 by 117 pixels.
; PLAN: r0=93(x), r1=18(y), r2=31(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 18
LDI r2, 31
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
