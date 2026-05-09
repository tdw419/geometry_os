; DESCRIPTION: Creates a purple rectangular region at (407, 200) spanning 25 by 35 pixels.
; PLAN: r0=407(x), r1=200(y), r2=25(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 200
LDI r2, 25
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
