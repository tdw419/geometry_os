; DESCRIPTION: Creates a purple rectangular region at (323, 14) spanning 105 by 101 pixels.
; PLAN: r0=323(x), r1=14(y), r2=105(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 14
LDI r2, 105
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
