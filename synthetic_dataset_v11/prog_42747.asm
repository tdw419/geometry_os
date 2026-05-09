; DESCRIPTION: Composite: . Then Places a yellow dot at position (191, 23). Then Renders a blue line between points (248, 145) and (37, 64).
; PLAN: r0=191(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=248(x1), r1=145(y1), r2=37(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (191, 23).
; PLAN: r0=191(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (248, 145) and (37, 64).
; PLAN: r0=248(x1), r1=145(y1), r2=37(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 145
LDI r2, 37
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
