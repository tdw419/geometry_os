; DESCRIPTION: Creates a purple filled rectangle of size 120x78 starting at (98, 133).
; PLAN: r0=98(x), r1=133(y), r2=120(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 133
LDI r2, 120
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
