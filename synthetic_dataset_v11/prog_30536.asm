; DESCRIPTION: Creates a purple rectangular region at (131, 19) spanning 51 by 62 pixels.
; PLAN: r0=131(x), r1=19(y), r2=51(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 19
LDI r2, 51
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
