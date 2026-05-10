; DESCRIPTION: Creates a purple rectangular region at (186, 101) spanning 45 by 88 pixels.
; PLAN: r0=186(x), r1=101(y), r2=45(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 101
LDI r2, 45
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
