; DESCRIPTION: Composite: . Then Places a black dot at position (70, 191). Then Places a yellow line segment connecting (88, 145) to (232, 36).
; PLAN: r0=70(x), r1=191(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=88(x1), r1=145(y1), r2=232(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (70, 191).
; PLAN: r0=70(x), r1=191(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 191
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (88, 145) to (232, 36).
; PLAN: r0=88(x1), r1=145(y1), r2=232(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 145
LDI r2, 232
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
