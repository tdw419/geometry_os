; DESCRIPTION: Creates a purple filled rectangle of size 99x67 starting at (68, 79).
; PLAN: r0=68(x), r1=79(y), r2=99(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 79
LDI r2, 99
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
