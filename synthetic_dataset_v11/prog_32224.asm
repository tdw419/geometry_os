; DESCRIPTION: Composite: . Then Places a red dot at position (138, 86). Then Renders a yellow line between points (124, 123) and (47, 145).
; PLAN: r0=138(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=124(x1), r1=123(y1), r2=47(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (138, 86).
; PLAN: r0=138(x), r1=86(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 86
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (124, 123) and (47, 145).
; PLAN: r0=124(x1), r1=123(y1), r2=47(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 123
LDI r2, 47
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
