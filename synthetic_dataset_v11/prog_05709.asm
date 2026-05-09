; DESCRIPTION: Creates a purple rectangular region at (148, 141) spanning 70 by 62 pixels.
; PLAN: r0=148(x), r1=141(y), r2=70(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 141
LDI r2, 70
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
