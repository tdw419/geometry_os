; DESCRIPTION: Creates a purple rectangular region at (93, 29) spanning 53 by 85 pixels.
; PLAN: r0=93(x), r1=29(y), r2=53(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 29
LDI r2, 53
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
