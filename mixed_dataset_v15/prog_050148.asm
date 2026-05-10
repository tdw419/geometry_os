; DESCRIPTION: Creates a purple filled rectangle of size 93x49 starting at (131, 109).
; PLAN: r0=131(x), r1=109(y), r2=93(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 109
LDI r2, 93
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
