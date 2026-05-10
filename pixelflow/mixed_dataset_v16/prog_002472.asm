; DESCRIPTION: Creates a purple filled rectangle of size 23x103 starting at (274, 14).
; PLAN: r0=274(x), r1=14(y), r2=23(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 14
LDI r2, 23
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
