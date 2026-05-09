; DESCRIPTION: Creates a purple rectangular region at (114, 88) spanning 22 by 77 pixels.
; PLAN: r0=114(x), r1=88(y), r2=22(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 88
LDI r2, 22
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
