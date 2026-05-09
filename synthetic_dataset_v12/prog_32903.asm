; DESCRIPTION: Creates a purple rectangular region at (491, 122) spanning 11 by 85 pixels.
; PLAN: r0=491(x), r1=122(y), r2=11(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 122
LDI r2, 11
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
