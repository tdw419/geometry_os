; DESCRIPTION: Renders a purple line between points (423, 48) and (485, 231).
; PLAN: r0=423(x1), r1=48(y1), r2=485(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 48
LDI r2, 485
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
