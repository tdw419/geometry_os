; DESCRIPTION: Composite: . Then Renders a green line between points (89, 110) and (129, 57). Then Places a purple dot at position (197, 164).
; PLAN: r0=89(x1), r1=110(y1), r2=129(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=197(x), r1=164(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (89, 110) and (129, 57).
; PLAN: r0=89(x1), r1=110(y1), r2=129(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 110
LDI r2, 129
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (197, 164).
; PLAN: r0=197(x), r1=164(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 164
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
