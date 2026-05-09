; DESCRIPTION: Creates a purple rectangular region at (106, 148) spanning 26 by 96 pixels.
; PLAN: r0=106(x), r1=148(y), r2=26(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 148
LDI r2, 26
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
