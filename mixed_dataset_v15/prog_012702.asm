; DESCRIPTION: Creates a purple filled rectangle of size 14x84 starting at (207, 184).
; PLAN: r0=207(x), r1=184(y), r2=14(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 184
LDI r2, 14
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
