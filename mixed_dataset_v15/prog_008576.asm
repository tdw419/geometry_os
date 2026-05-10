; DESCRIPTION: Draws a blue line from (338, 85) to (170, 51).
; PLAN: r0=338(x1), r1=85(y1), r2=170(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 85
LDI r2, 170
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
