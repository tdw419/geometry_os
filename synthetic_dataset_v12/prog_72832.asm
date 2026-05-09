; DESCRIPTION: Places a black line segment connecting (432, 124) to (294, 216).
; PLAN: r0=432(x1), r1=124(y1), r2=294(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 124
LDI r2, 294
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
