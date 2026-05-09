; DESCRIPTION: Composite: . Then Renders a black line between points (17, 80) and (123, 68). Then Sets a single blue pixel at (108, 169).
; PLAN: r0=17(x1), r1=80(y1), r2=123(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (17, 80) and (123, 68).
; PLAN: r0=17(x1), r1=80(y1), r2=123(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 80
LDI r2, 123
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (108, 169).
; PLAN: r0=108(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
