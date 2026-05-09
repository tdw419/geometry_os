; DESCRIPTION: Draws a purple line from (485, 19) to (325, 10).
; PLAN: r0=485(x1), r1=19(y1), r2=325(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 19
LDI r2, 325
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
