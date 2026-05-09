; DESCRIPTION: Renders a blue line between points (145, 233) and (51, 113).
; PLAN: r0=145(x1), r1=233(y1), r2=51(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 233
LDI r2, 51
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
