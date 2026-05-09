; DESCRIPTION: Creates a purple rectangular region at (194, 67) spanning 16 by 43 pixels.
; PLAN: r0=194(x), r1=67(y), r2=16(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 67
LDI r2, 16
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
