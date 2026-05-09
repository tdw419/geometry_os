; DESCRIPTION: Creates a purple rectangular region at (98, 88) spanning 102 by 95 pixels.
; PLAN: r0=98(x), r1=88(y), r2=102(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 88
LDI r2, 102
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
