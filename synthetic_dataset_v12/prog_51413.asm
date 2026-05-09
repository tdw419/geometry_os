; DESCRIPTION: Renders a magenta line between points (109, 98) and (170, 99).
; PLAN: r0=109(x1), r1=98(y1), r2=170(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 98
LDI r2, 170
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
