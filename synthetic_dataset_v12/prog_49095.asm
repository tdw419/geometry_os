; DESCRIPTION: Creates a purple rectangular region at (322, 47) spanning 37 by 52 pixels.
; PLAN: r0=322(x), r1=47(y), r2=37(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 47
LDI r2, 37
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
