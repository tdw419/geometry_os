; DESCRIPTION: Creates a purple filled rectangle of size 93x101 starting at (301, 2).
; PLAN: r0=301(x), r1=2(y), r2=93(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 2
LDI r2, 93
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
