; DESCRIPTION: Creates a purple rectangular region at (245, 92) spanning 26 by 67 pixels.
; PLAN: r0=245(x), r1=92(y), r2=26(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 92
LDI r2, 26
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
