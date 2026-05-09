; DESCRIPTION: Creates a purple rectangular region at (123, 4) spanning 115 by 69 pixels.
; PLAN: r0=123(x), r1=4(y), r2=115(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 4
LDI r2, 115
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
