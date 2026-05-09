; DESCRIPTION: Creates a purple rectangular region at (31, 132) spanning 112 by 72 pixels.
; PLAN: r0=31(x), r1=132(y), r2=112(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 132
LDI r2, 112
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
