; DESCRIPTION: Renders a blue line between points (92, 202) and (51, 191).
; PLAN: r0=92(x1), r1=202(y1), r2=51(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 202
LDI r2, 51
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
