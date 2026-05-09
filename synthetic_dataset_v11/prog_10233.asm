; DESCRIPTION: Renders a magenta line between points (89, 143) and (130, 196).
; PLAN: r0=89(x1), r1=143(y1), r2=130(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 143
LDI r2, 130
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
