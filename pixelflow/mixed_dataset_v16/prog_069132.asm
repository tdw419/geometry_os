; DESCRIPTION: Creates a purple rectangular region at (123, 110) spanning 60 by 90 pixels.
; PLAN: r0=123(x), r1=110(y), r2=60(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 110
LDI r2, 60
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
