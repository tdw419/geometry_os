; DESCRIPTION: Creates a purple filled rectangle of size 120x38 starting at (149, 100).
; PLAN: r0=149(x), r1=100(y), r2=120(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 100
LDI r2, 120
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
