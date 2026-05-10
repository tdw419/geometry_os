; DESCRIPTION: Creates a purple rectangular region at (211, 90) spanning 54 by 51 pixels.
; PLAN: r0=211(x), r1=90(y), r2=54(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 90
LDI r2, 54
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
