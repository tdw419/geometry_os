; DESCRIPTION: Creates a purple rectangular region at (141, 45) spanning 26 by 53 pixels.
; PLAN: r0=141(x), r1=45(y), r2=26(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 45
LDI r2, 26
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
