; DESCRIPTION: Creates a purple filled rectangle of size 77x23 starting at (166, 15).
; PLAN: r0=166(x), r1=15(y), r2=77(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 15
LDI r2, 77
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
