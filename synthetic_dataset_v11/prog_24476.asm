; DESCRIPTION: Creates a purple rectangular region at (67, 135) spanning 81 by 109 pixels.
; PLAN: r0=67(x), r1=135(y), r2=81(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 135
LDI r2, 81
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
