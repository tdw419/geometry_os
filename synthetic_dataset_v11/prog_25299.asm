; DESCRIPTION: Creates a purple rectangular region at (53, 7) spanning 45 by 85 pixels.
; PLAN: r0=53(x), r1=7(y), r2=45(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 7
LDI r2, 45
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
