; DESCRIPTION: Composite: . Then Renders a black line between points (155, 15) and (128, 231). Then Sets a single blue pixel at (92, 200).
; PLAN: r0=155(x1), r1=15(y1), r2=128(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=200(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (155, 15) and (128, 231).
; PLAN: r0=155(x1), r1=15(y1), r2=128(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 15
LDI r2, 128
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (92, 200).
; PLAN: r0=92(x), r1=200(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 200
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
