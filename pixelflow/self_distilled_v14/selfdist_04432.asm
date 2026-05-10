; DESCRIPTION: Creates a purple filled rectangle of size 78x73 starting at (344, 39).
; PLAN: r0=344(x), r1=39(y), r2=78(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 39
LDI r2, 78
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
