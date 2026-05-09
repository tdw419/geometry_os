; DESCRIPTION: Creates a purple rectangular region at (117, 123) spanning 115 by 78 pixels.
; PLAN: r0=117(x), r1=123(y), r2=115(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 123
LDI r2, 115
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
