; DESCRIPTION: Creates a purple rectangular region at (44, 76) spanning 47 by 49 pixels.
; PLAN: r0=44(x), r1=76(y), r2=47(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 76
LDI r2, 47
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
