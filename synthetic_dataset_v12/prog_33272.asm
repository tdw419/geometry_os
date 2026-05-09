; DESCRIPTION: Creates a purple rectangular region at (10, 23) spanning 51 by 49 pixels.
; PLAN: r0=10(x), r1=23(y), r2=51(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 23
LDI r2, 51
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
