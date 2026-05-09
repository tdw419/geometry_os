; DESCRIPTION: Creates a purple rectangular region at (133, 24) spanning 100 by 44 pixels.
; PLAN: r0=133(x), r1=24(y), r2=100(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 24
LDI r2, 100
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
