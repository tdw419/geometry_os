; DESCRIPTION: Creates a purple rectangular region at (162, 52) spanning 72 by 94 pixels.
; PLAN: r0=162(x), r1=52(y), r2=72(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 52
LDI r2, 72
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
