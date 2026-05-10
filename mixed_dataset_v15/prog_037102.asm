; DESCRIPTION: Creates a purple rectangular region at (153, 97) spanning 85 by 96 pixels.
; PLAN: r0=153(x), r1=97(y), r2=85(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 97
LDI r2, 85
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
