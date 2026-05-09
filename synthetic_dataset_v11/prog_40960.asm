; DESCRIPTION: Renders a blue box of size 51x35 starting at (190, 87).
; PLAN: r0=190(x), r1=87(y), r2=51(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 87
LDI r2, 51
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
