; DESCRIPTION: Creates a purple rectangular region at (364, 131) spanning 52 by 116 pixels.
; PLAN: r0=364(x), r1=131(y), r2=52(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 131
LDI r2, 52
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
