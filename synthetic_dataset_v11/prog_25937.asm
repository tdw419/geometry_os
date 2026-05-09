; DESCRIPTION: Composite: . Then Sets a single blue pixel at (22, 255). Then Places a black line segment connecting (21, 113) to (232, 175).
; PLAN: r0=22(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=21(x1), r1=113(y1), r2=232(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (22, 255).
; PLAN: r0=22(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 255
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (21, 113) to (232, 175).
; PLAN: r0=21(x1), r1=113(y1), r2=232(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 113
LDI r2, 232
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
