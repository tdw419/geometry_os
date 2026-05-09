; DESCRIPTION: Creates a purple rectangular region at (177, 11) spanning 51 by 107 pixels.
; PLAN: r0=177(x), r1=11(y), r2=51(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 11
LDI r2, 51
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
