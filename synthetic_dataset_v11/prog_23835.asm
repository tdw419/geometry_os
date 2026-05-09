; DESCRIPTION: Creates a purple rectangular region at (33, 107) spanning 101 by 90 pixels.
; PLAN: r0=33(x), r1=107(y), r2=101(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 107
LDI r2, 101
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
