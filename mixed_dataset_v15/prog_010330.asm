; DESCRIPTION: Creates a purple filled rectangle of size 90x77 starting at (244, 27).
; PLAN: r0=244(x), r1=27(y), r2=90(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 27
LDI r2, 90
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
