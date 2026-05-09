; DESCRIPTION: Renders a blue line between points (196, 51) and (169, 180).
; PLAN: r0=196(x1), r1=51(y1), r2=169(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 51
LDI r2, 169
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
