; DESCRIPTION: Creates a purple filled rectangle of size 68x95 starting at (13, 127).
; PLAN: r0=13(x), r1=127(y), r2=68(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 127
LDI r2, 68
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
