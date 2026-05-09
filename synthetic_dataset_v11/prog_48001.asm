; DESCRIPTION: Composite: . Then Renders a blue box of size 10x99 starting at (81, 96). Then Sets a single red pixel at (84, 206).
; PLAN: r0=81(x), r1=96(y), r2=10(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=84(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 10x99 starting at (81, 96).
; PLAN: r0=81(x), r1=96(y), r2=10(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 96
LDI r2, 10
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (84, 206).
; PLAN: r0=84(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 206
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
