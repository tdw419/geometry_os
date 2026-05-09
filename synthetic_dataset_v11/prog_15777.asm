; DESCRIPTION: Composite: . Then Places a black dot at position (226, 234). Then Renders a black line between points (47, 93) and (144, 149).
; PLAN: r0=226(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=47(x1), r1=93(y1), r2=144(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (226, 234).
; PLAN: r0=226(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 234
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (47, 93) and (144, 149).
; PLAN: r0=47(x1), r1=93(y1), r2=144(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 93
LDI r2, 144
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
