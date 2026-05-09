; DESCRIPTION: Creates a purple rectangular region at (116, 88) spanning 108 by 25 pixels.
; PLAN: r0=116(x), r1=88(y), r2=108(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 88
LDI r2, 108
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
