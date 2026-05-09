; DESCRIPTION: Creates a purple rectangular region at (153, 123) spanning 60 by 11 pixels.
; PLAN: r0=153(x), r1=123(y), r2=60(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 123
LDI r2, 60
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
