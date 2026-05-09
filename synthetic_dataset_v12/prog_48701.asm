; DESCRIPTION: Creates a purple rectangular region at (204, 56) spanning 81 by 18 pixels.
; PLAN: r0=204(x), r1=56(y), r2=81(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 56
LDI r2, 81
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
