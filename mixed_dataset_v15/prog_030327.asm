; DESCRIPTION: Creates a purple filled rectangle of size 55x87 starting at (13, 70).
; PLAN: r0=13(x), r1=70(y), r2=55(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 70
LDI r2, 55
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
