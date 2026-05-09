; DESCRIPTION: Creates a purple rectangular region at (269, 38) spanning 51 by 102 pixels.
; PLAN: r0=269(x), r1=38(y), r2=51(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 38
LDI r2, 51
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
