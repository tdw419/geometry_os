; DESCRIPTION: Creates a purple rectangular region at (204, 49) spanning 112 by 71 pixels.
; PLAN: r0=204(x), r1=49(y), r2=112(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 49
LDI r2, 112
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
