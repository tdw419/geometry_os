; DESCRIPTION: Creates a purple filled rectangle of size 95x74 starting at (366, 45).
; PLAN: r0=366(x), r1=45(y), r2=95(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 45
LDI r2, 95
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
