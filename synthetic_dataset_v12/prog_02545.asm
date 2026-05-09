; DESCRIPTION: Creates a purple rectangular region at (373, 148) spanning 36 by 106 pixels.
; PLAN: r0=373(x), r1=148(y), r2=36(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 148
LDI r2, 36
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
