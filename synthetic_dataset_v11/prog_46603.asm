; DESCRIPTION: Creates a purple rectangular region at (133, 30) spanning 72 by 43 pixels.
; PLAN: r0=133(x), r1=30(y), r2=72(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 30
LDI r2, 72
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
