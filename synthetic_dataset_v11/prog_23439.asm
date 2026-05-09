; DESCRIPTION: Creates a purple rectangular region at (5, 74) spanning 81 by 73 pixels.
; PLAN: r0=5(x), r1=74(y), r2=81(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 74
LDI r2, 81
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
