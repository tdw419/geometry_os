; DESCRIPTION: Draws a black line from (160, 67) to (89, 124).
; PLAN: r0=160(x1), r1=67(y1), r2=89(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 67
LDI r2, 89
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
