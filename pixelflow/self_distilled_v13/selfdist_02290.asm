; DESCRIPTION: Creates a purple filled rectangle of size 76x66 starting at (337, 47).
; PLAN: r0=337(x), r1=47(y), r2=76(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 47
LDI r2, 76
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
