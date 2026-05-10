; DESCRIPTION: Creates a purple filled rectangle of size 98x61 starting at (21, 11).
; PLAN: r0=21(x), r1=11(y), r2=98(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 11
LDI r2, 98
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
