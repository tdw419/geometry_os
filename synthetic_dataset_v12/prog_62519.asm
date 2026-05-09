; DESCRIPTION: Creates a purple rectangular region at (101, 85) spanning 72 by 17 pixels.
; PLAN: r0=101(x), r1=85(y), r2=72(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 85
LDI r2, 72
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
