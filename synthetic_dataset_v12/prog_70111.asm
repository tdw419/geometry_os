; DESCRIPTION: Renders a blue box of size 66x118 starting at (419, 52).
; PLAN: r0=419(x), r1=52(y), r2=66(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 52
LDI r2, 66
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
