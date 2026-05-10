; DESCRIPTION: Creates a purple filled rectangle of size 37x67 starting at (250, 12).
; PLAN: r0=250(x), r1=12(y), r2=37(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 12
LDI r2, 37
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
