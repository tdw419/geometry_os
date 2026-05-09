; DESCRIPTION: Renders a black line between points (9, 227) and (485, 157).
; PLAN: r0=9(x1), r1=227(y1), r2=485(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 227
LDI r2, 485
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
