; DESCRIPTION: Creates a purple filled rectangle of size 86x102 starting at (158, 180).
; PLAN: r0=158(x), r1=180(y), r2=86(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 180
LDI r2, 86
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
