; DESCRIPTION: Creates a purple rectangular region at (194, 87) spanning 69 by 58 pixels.
; PLAN: r0=194(x), r1=87(y), r2=69(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 87
LDI r2, 69
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
