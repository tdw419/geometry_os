; DESCRIPTION: Creates a purple rectangular region at (114, 62) spanning 35 by 87 pixels.
; PLAN: r0=114(x), r1=62(y), r2=35(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 62
LDI r2, 35
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
