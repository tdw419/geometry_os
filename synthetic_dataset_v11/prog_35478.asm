; DESCRIPTION: Creates a purple rectangular region at (34, 0) spanning 116 by 98 pixels.
; PLAN: r0=34(x), r1=0(y), r2=116(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 0
LDI r2, 116
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
