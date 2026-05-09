; DESCRIPTION: Renders a purple line between points (485, 217) and (367, 50).
; PLAN: r0=485(x1), r1=217(y1), r2=367(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 217
LDI r2, 367
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
