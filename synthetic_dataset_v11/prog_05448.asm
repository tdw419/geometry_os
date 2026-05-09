; DESCRIPTION: Renders a blue box of size 66x20 starting at (145, 66).
; PLAN: r0=145(x), r1=66(y), r2=66(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 66
LDI r2, 66
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
