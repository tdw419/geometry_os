; DESCRIPTION: Renders a black line between points (288, 145) and (370, 80).
; PLAN: r0=288(x1), r1=145(y1), r2=370(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 145
LDI r2, 370
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
