; DESCRIPTION: Composite: . Then Places a blue dot at position (236, 110). Then Renders a blue line between points (165, 248) and (94, 176).
; PLAN: r0=236(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=165(x1), r1=248(y1), r2=94(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (236, 110).
; PLAN: r0=236(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (165, 248) and (94, 176).
; PLAN: r0=165(x1), r1=248(y1), r2=94(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 248
LDI r2, 94
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
