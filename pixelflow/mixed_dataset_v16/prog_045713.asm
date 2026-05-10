; DESCRIPTION: Creates a purple rectangular region at (3, 34) spanning 97 by 112 pixels.
; PLAN: r0=3(x), r1=34(y), r2=97(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 34
LDI r2, 97
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
