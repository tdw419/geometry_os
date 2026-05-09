; DESCRIPTION: Renders a magenta line between points (11, 51) and (124, 143).
; PLAN: r0=11(x1), r1=51(y1), r2=124(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 51
LDI r2, 124
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
