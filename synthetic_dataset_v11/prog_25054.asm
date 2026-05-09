; DESCRIPTION: Creates a purple rectangular region at (81, 88) spanning 25 by 36 pixels.
; PLAN: r0=81(x), r1=88(y), r2=25(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 88
LDI r2, 25
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
