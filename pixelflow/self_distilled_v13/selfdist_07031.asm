; DESCRIPTION: Creates a purple filled rectangle of size 109x48 starting at (132, 119).
; PLAN: r0=132(x), r1=119(y), r2=109(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 119
LDI r2, 109
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
