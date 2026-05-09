; DESCRIPTION: Creates a purple rectangular region at (106, 31) spanning 93 by 73 pixels.
; PLAN: r0=106(x), r1=31(y), r2=93(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 31
LDI r2, 93
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
