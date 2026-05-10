; DESCRIPTION: Creates a purple filled rectangle of size 77x90 starting at (275, 40).
; PLAN: r0=275(x), r1=40(y), r2=77(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 40
LDI r2, 77
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
