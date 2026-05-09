; DESCRIPTION: Creates a purple rectangular region at (279, 107) spanning 31 by 34 pixels.
; PLAN: r0=279(x), r1=107(y), r2=31(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 107
LDI r2, 31
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
