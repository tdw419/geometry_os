; DESCRIPTION: Renders a magenta line between points (51, 18) and (372, 36).
; PLAN: r0=51(x1), r1=18(y1), r2=372(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 18
LDI r2, 372
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
