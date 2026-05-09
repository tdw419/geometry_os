; DESCRIPTION: Creates a purple rectangular region at (149, 67) spanning 118 by 106 pixels.
; PLAN: r0=149(x), r1=67(y), r2=118(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 67
LDI r2, 118
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
