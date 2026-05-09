; DESCRIPTION: Creates a purple rectangular region at (100, 28) spanning 97 by 24 pixels.
; PLAN: r0=100(x), r1=28(y), r2=97(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 28
LDI r2, 97
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
