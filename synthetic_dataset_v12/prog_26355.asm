; DESCRIPTION: Creates a purple rectangular region at (26, 87) spanning 14 by 101 pixels.
; PLAN: r0=26(x), r1=87(y), r2=14(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 87
LDI r2, 14
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
