; DESCRIPTION: Draws a purple line from (485, 0) to (350, 51).
; PLAN: r0=485(x1), r1=0(y1), r2=350(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 0
LDI r2, 350
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
