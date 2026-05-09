; DESCRIPTION: Creates a purple rectangular region at (88, 226) spanning 53 by 25 pixels.
; PLAN: r0=88(x), r1=226(y), r2=53(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 226
LDI r2, 53
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
