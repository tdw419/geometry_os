; DESCRIPTION: Creates a purple rectangular region at (322, 118) spanning 46 by 37 pixels.
; PLAN: r0=322(x), r1=118(y), r2=46(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 118
LDI r2, 46
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
