; DESCRIPTION: Creates a purple filled rectangle of size 30x109 starting at (389, 80).
; PLAN: r0=389(x), r1=80(y), r2=30(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 80
LDI r2, 30
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
