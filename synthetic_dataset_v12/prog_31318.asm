; DESCRIPTION: Renders a black line between points (432, 87) and (470, 161).
; PLAN: r0=432(x1), r1=87(y1), r2=470(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 87
LDI r2, 470
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
