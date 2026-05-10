; DESCRIPTION: Creates a purple filled rectangle of size 44x25 starting at (382, 148).
; PLAN: r0=382(x), r1=148(y), r2=44(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 148
LDI r2, 44
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
