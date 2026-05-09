; DESCRIPTION: Creates a purple rectangular region at (388, 174) spanning 109 by 22 pixels.
; PLAN: r0=388(x), r1=174(y), r2=109(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 174
LDI r2, 109
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
