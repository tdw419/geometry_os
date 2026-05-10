; DESCRIPTION: Creates a blue filled rectangle of size 120x119 starting at (325, 68).
; PLAN: r0=325(x), r1=68(y), r2=120(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 68
LDI r2, 120
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
