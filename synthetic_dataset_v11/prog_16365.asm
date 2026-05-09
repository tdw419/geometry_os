; DESCRIPTION: Creates a purple rectangular region at (95, 36) spanning 88 by 43 pixels.
; PLAN: r0=95(x), r1=36(y), r2=88(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 36
LDI r2, 88
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
