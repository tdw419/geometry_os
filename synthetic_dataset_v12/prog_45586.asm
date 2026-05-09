; DESCRIPTION: Creates a purple rectangular region at (266, 34) spanning 93 by 97 pixels.
; PLAN: r0=266(x), r1=34(y), r2=93(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 34
LDI r2, 93
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
