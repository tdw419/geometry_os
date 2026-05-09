; DESCRIPTION: Creates a purple rectangular region at (35, 84) spanning 30 by 102 pixels.
; PLAN: r0=35(x), r1=84(y), r2=30(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 84
LDI r2, 30
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
