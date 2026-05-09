; DESCRIPTION: Creates a purple rectangular region at (97, 124) spanning 108 by 47 pixels.
; PLAN: r0=97(x), r1=124(y), r2=108(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 124
LDI r2, 108
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
