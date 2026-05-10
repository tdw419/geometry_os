; DESCRIPTION: Creates a purple filled rectangle of size 56x79 starting at (24, 118).
; PLAN: r0=24(x), r1=118(y), r2=56(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 118
LDI r2, 56
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
