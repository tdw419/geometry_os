; DESCRIPTION: Renders a magenta line between points (141, 51) and (71, 26).
; PLAN: r0=141(x1), r1=51(y1), r2=71(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 51
LDI r2, 71
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
