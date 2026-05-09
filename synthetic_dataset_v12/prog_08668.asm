; DESCRIPTION: Creates a purple rectangular region at (53, 61) spanning 89 by 81 pixels.
; PLAN: r0=53(x), r1=61(y), r2=89(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 61
LDI r2, 89
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
