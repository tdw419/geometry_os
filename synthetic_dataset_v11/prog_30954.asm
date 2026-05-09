; DESCRIPTION: Composite: . Then Places a purple dot at position (126, 229). Then Places a blue line segment connecting (249, 222) to (141, 105).
; PLAN: r0=126(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=249(x1), r1=222(y1), r2=141(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (126, 229).
; PLAN: r0=126(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue line segment connecting (249, 222) to (141, 105).
; PLAN: r0=249(x1), r1=222(y1), r2=141(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 222
LDI r2, 141
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
