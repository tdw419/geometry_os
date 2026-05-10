; DESCRIPTION: Creates a purple rectangular region at (274, 51) spanning 52 by 72 pixels.
; PLAN: r0=274(x), r1=51(y), r2=52(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 51
LDI r2, 52
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
