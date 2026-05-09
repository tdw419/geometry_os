; DESCRIPTION: Composite: . Then Renders a magenta line between points (201, 174) and (125, 169). Then Places a red dot at position (22, 109).
; PLAN: r0=201(x1), r1=174(y1), r2=125(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=22(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (201, 174) and (125, 169).
; PLAN: r0=201(x1), r1=174(y1), r2=125(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 174
LDI r2, 125
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (22, 109).
; PLAN: r0=22(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
