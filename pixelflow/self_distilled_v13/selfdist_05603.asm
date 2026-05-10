; DESCRIPTION: Creates a purple filled rectangle of size 54x90 starting at (76, 6).
; PLAN: r0=76(x), r1=6(y), r2=54(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 6
LDI r2, 54
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
