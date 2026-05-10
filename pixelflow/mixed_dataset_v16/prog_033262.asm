; DESCRIPTION: Creates a purple filled rectangle of size 22x119 starting at (24, 180).
; PLAN: r0=24(x), r1=180(y), r2=22(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 180
LDI r2, 22
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
