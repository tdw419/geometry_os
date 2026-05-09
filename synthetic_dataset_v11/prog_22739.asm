; DESCRIPTION: Composite: . Then Places a black line segment connecting (109, 96) to (194, 28). Then Sets a single black pixel at (58, 114).
; PLAN: r0=109(x1), r1=96(y1), r2=194(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (109, 96) to (194, 28).
; PLAN: r0=109(x1), r1=96(y1), r2=194(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 96
LDI r2, 194
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (58, 114).
; PLAN: r0=58(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
HALT
