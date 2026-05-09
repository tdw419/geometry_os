; DESCRIPTION: Renders a blue box of size 76x119 starting at (258, 23).
; PLAN: r0=258(x), r1=23(y), r2=76(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 23
LDI r2, 76
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
