; DESCRIPTION: Creates a purple rectangular region at (123, 3) spanning 97 by 73 pixels.
; PLAN: r0=123(x), r1=3(y), r2=97(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 3
LDI r2, 97
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
