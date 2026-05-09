; DESCRIPTION: Creates a purple rectangular region at (332, 7) spanning 108 by 62 pixels.
; PLAN: r0=332(x), r1=7(y), r2=108(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 7
LDI r2, 108
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
