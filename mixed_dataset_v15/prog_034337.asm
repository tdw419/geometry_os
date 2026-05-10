; DESCRIPTION: Creates a purple filled rectangle of size 79x92 starting at (351, 151).
; PLAN: r0=351(x), r1=151(y), r2=79(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 151
LDI r2, 79
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
