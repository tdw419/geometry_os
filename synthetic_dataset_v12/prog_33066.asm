; DESCRIPTION: Renders a purple line between points (51, 72) and (254, 72).
; PLAN: r0=51(x1), r1=72(y1), r2=254(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 72
LDI r2, 254
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
