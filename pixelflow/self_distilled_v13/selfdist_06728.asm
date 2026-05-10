; DESCRIPTION: Creates a purple filled rectangle of size 65x15 starting at (103, 130).
; PLAN: r0=103(x), r1=130(y), r2=65(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 130
LDI r2, 65
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
