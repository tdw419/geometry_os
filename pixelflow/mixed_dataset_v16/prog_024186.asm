; DESCRIPTION: Creates a purple rectangular region at (69, 21) spanning 31 by 118 pixels.
; PLAN: r0=69(x), r1=21(y), r2=31(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 21
LDI r2, 31
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
