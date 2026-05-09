; DESCRIPTION: Renders a magenta line between points (102, 91) and (80, 51).
; PLAN: r0=102(x1), r1=91(y1), r2=80(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 91
LDI r2, 80
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
