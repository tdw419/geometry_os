; DESCRIPTION: Creates a purple rectangular region at (219, 43) spanning 92 by 118 pixels.
; PLAN: r0=219(x), r1=43(y), r2=92(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 43
LDI r2, 92
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
