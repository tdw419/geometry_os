; DESCRIPTION: Creates a purple rectangular region at (414, 11) spanning 69 by 29 pixels.
; PLAN: r0=414(x), r1=11(y), r2=69(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 11
LDI r2, 69
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
