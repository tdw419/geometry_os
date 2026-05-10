; DESCRIPTION: Creates a purple filled rectangle of size 31x84 starting at (236, 200).
; PLAN: r0=236(x), r1=200(y), r2=31(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 200
LDI r2, 31
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
