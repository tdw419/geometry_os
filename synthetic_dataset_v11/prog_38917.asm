; DESCRIPTION: Renders a blue box of size 73x37 starting at (93, 15).
; PLAN: r0=93(x), r1=15(y), r2=73(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 15
LDI r2, 73
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
