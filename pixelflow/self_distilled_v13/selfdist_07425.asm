; DESCRIPTION: Creates a purple filled rectangle of size 71x100 starting at (174, 101).
; PLAN: r0=174(x), r1=101(y), r2=71(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 101
LDI r2, 71
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
