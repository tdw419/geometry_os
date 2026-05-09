; DESCRIPTION: Composite: . Then Renders a purple line between points (71, 223) and (215, 250). Then Sets a single blue pixel at (191, 45).
; PLAN: r0=71(x1), r1=223(y1), r2=215(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=191(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (71, 223) and (215, 250).
; PLAN: r0=71(x1), r1=223(y1), r2=215(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 223
LDI r2, 215
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (191, 45).
; PLAN: r0=191(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
