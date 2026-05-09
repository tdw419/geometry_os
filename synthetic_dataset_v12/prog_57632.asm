; DESCRIPTION: Creates a purple rectangular region at (19, 87) spanning 119 by 61 pixels.
; PLAN: r0=19(x), r1=87(y), r2=119(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 87
LDI r2, 119
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
