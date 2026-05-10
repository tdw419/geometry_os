; DESCRIPTION: Creates a purple filled rectangle of size 70x42 starting at (194, 100).
; PLAN: r0=194(x), r1=100(y), r2=70(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 100
LDI r2, 70
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
