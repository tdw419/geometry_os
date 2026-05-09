; DESCRIPTION: Composite: . Then Places a blue dot at position (129, 131). Then Renders a purple line between points (147, 192) and (124, 4).
; PLAN: r0=129(x), r1=131(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=147(x1), r1=192(y1), r2=124(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (129, 131).
; PLAN: r0=129(x), r1=131(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 131
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (147, 192) and (124, 4).
; PLAN: r0=147(x1), r1=192(y1), r2=124(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 192
LDI r2, 124
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
