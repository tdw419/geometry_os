; DESCRIPTION: Draws a black line from (110, 72) to (485, 216).
; PLAN: r0=110(x1), r1=72(y1), r2=485(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 72
LDI r2, 485
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
