; DESCRIPTION: Creates a purple rectangular region at (432, 101) spanning 61 by 55 pixels.
; PLAN: r0=432(x), r1=101(y), r2=61(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 101
LDI r2, 61
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
