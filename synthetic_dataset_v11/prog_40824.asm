; DESCRIPTION: Creates a purple rectangular region at (88, 6) spanning 115 by 60 pixels.
; PLAN: r0=88(x), r1=6(y), r2=115(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 6
LDI r2, 115
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
