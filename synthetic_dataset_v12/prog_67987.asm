; DESCRIPTION: Renders a purple line between points (447, 81) and (485, 25).
; PLAN: r0=447(x1), r1=81(y1), r2=485(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 81
LDI r2, 485
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
