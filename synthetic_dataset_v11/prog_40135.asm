; DESCRIPTION: Creates a purple rectangular region at (135, 106) spanning 72 by 114 pixels.
; PLAN: r0=135(x), r1=106(y), r2=72(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 106
LDI r2, 72
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
