; DESCRIPTION: Creates a purple rectangular region at (148, 67) spanning 115 by 88 pixels.
; PLAN: r0=148(x), r1=67(y), r2=115(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 67
LDI r2, 115
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
