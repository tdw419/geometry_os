; DESCRIPTION: Creates a purple rectangular region at (35, 33) spanning 118 by 32 pixels.
; PLAN: r0=35(x), r1=33(y), r2=118(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 33
LDI r2, 118
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
