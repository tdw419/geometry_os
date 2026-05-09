; DESCRIPTION: Creates a purple rectangular region at (183, 35) spanning 112 by 90 pixels.
; PLAN: r0=183(x), r1=35(y), r2=112(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 35
LDI r2, 112
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
