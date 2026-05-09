; DESCRIPTION: Creates a purple rectangular region at (51, 15) spanning 78 by 120 pixels.
; PLAN: r0=51(x), r1=15(y), r2=78(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 15
LDI r2, 78
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
