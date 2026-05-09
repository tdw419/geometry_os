; DESCRIPTION: Creates a purple rectangular region at (23, 123) spanning 90 by 43 pixels.
; PLAN: r0=23(x), r1=123(y), r2=90(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 123
LDI r2, 90
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
