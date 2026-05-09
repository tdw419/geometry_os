; DESCRIPTION: Renders a blue line between points (486, 51) and (399, 52).
; PLAN: r0=486(x1), r1=51(y1), r2=399(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 51
LDI r2, 399
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
