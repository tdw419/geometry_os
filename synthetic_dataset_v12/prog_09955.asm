; DESCRIPTION: Renders a blue box of size 93x66 starting at (145, 170).
; PLAN: r0=145(x), r1=170(y), r2=93(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 170
LDI r2, 93
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
