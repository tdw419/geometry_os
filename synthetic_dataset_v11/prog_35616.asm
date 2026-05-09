; DESCRIPTION: Composite: . Then Sets a single black pixel at (232, 129). Then Places a black line segment connecting (66, 113) to (181, 152).
; PLAN: r0=232(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=66(x1), r1=113(y1), r2=181(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (232, 129).
; PLAN: r0=232(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (66, 113) to (181, 152).
; PLAN: r0=66(x1), r1=113(y1), r2=181(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 113
LDI r2, 181
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
