; DESCRIPTION: Creates a purple rectangular region at (8, 53) spanning 106 by 18 pixels.
; PLAN: r0=8(x), r1=53(y), r2=106(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 53
LDI r2, 106
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
