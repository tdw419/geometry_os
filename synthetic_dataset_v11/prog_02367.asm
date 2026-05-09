; DESCRIPTION: Creates a purple rectangular region at (114, 92) spanning 33 by 106 pixels.
; PLAN: r0=114(x), r1=92(y), r2=33(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 92
LDI r2, 33
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
