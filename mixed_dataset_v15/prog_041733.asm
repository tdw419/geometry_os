; DESCRIPTION: Renders a magenta line between points (103, 118) and (417, 123).
; PLAN: r0=103(x1), r1=118(y1), r2=417(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 118
LDI r2, 417
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
