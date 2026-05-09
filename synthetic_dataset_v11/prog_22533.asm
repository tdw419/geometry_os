; DESCRIPTION: Creates a purple rectangular region at (33, 99) spanning 108 by 99 pixels.
; PLAN: r0=33(x), r1=99(y), r2=108(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 99
LDI r2, 108
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
