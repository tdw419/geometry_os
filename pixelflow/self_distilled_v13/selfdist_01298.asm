; DESCRIPTION: Creates a purple filled rectangle of size 53x71 starting at (0, 156).
; PLAN: r0=0(x), r1=156(y), r2=53(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 156
LDI r2, 53
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
