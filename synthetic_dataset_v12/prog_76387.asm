; DESCRIPTION: Creates a purple rectangular region at (326, 162) spanning 108 by 92 pixels.
; PLAN: r0=326(x), r1=162(y), r2=108(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 162
LDI r2, 108
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
