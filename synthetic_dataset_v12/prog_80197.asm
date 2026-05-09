; DESCRIPTION: Renders a blue line between points (428, 51) and (485, 136).
; PLAN: r0=428(x1), r1=51(y1), r2=485(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 51
LDI r2, 485
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
