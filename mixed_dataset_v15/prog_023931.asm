; DESCRIPTION: Creates a purple filled rectangle of size 35x23 starting at (116, 87).
; PLAN: r0=116(x), r1=87(y), r2=35(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 87
LDI r2, 35
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
