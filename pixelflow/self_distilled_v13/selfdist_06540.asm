; DESCRIPTION: Creates a purple filled rectangle of size 95x31 starting at (363, 167).
; PLAN: r0=363(x), r1=167(y), r2=95(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 167
LDI r2, 95
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
