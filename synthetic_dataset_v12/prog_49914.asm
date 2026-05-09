; DESCRIPTION: Creates a purple rectangular region at (121, 76) spanning 97 by 20 pixels.
; PLAN: r0=121(x), r1=76(y), r2=97(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 76
LDI r2, 97
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
