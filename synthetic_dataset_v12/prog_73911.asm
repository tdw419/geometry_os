; DESCRIPTION: Creates a purple rectangular region at (357, 135) spanning 53 by 116 pixels.
; PLAN: r0=357(x), r1=135(y), r2=53(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 135
LDI r2, 53
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
