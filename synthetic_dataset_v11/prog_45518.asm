; DESCRIPTION: Renders a magenta line between points (107, 4) and (3, 51).
; PLAN: r0=107(x1), r1=4(y1), r2=3(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 4
LDI r2, 3
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
