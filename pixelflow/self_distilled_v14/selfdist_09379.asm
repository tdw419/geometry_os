; DESCRIPTION: Creates a purple filled rectangle of size 36x80 starting at (65, 194).
; PLAN: r0=65(x), r1=194(y), r2=36(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 194
LDI r2, 36
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
