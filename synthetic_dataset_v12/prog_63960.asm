; DESCRIPTION: Creates a purple rectangular region at (39, 30) spanning 83 by 108 pixels.
; PLAN: r0=39(x), r1=30(y), r2=83(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 30
LDI r2, 83
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
