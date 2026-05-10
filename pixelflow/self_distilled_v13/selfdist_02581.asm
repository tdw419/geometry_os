; DESCRIPTION: Creates a purple filled rectangle of size 29x72 starting at (191, 72).
; PLAN: r0=191(x), r1=72(y), r2=29(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 72
LDI r2, 29
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
