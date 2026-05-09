; DESCRIPTION: Creates a purple rectangular region at (500, 181) spanning 11 by 34 pixels.
; PLAN: r0=500(x), r1=181(y), r2=11(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 181
LDI r2, 11
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
