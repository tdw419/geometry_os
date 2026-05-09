; DESCRIPTION: Renders a blue line between points (2, 51) and (80, 239).
; PLAN: r0=2(x1), r1=51(y1), r2=80(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 51
LDI r2, 80
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
