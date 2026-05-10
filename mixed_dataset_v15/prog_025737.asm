; DESCRIPTION: Creates a purple filled rectangle of size 72x28 starting at (342, 109).
; PLAN: r0=342(x), r1=109(y), r2=72(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 109
LDI r2, 72
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
