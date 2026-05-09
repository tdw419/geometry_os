; DESCRIPTION: Creates a purple rectangular region at (26, 68) spanning 105 by 31 pixels.
; PLAN: r0=26(x), r1=68(y), r2=105(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 68
LDI r2, 105
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
