; DESCRIPTION: Creates a purple filled rectangle of size 34x26 starting at (359, 178).
; PLAN: r0=359(x), r1=178(y), r2=34(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 178
LDI r2, 34
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
