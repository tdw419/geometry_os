; DESCRIPTION: Composite: . Then Places a yellow dot at position (171, 58). Then Renders a orange line between points (31, 250) and (163, 248).
; PLAN: r0=171(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=31(x1), r1=250(y1), r2=163(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (171, 58).
; PLAN: r0=171(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a orange line between points (31, 250) and (163, 248).
; PLAN: r0=31(x1), r1=250(y1), r2=163(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 250
LDI r2, 163
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
