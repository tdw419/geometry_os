; DESCRIPTION: Renders a blue line between points (51, 52) and (493, 167).
; PLAN: r0=51(x1), r1=52(y1), r2=493(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 52
LDI r2, 493
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
