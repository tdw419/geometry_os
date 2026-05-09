; DESCRIPTION: Renders a black line between points (4, 89) and (48, 218).
; PLAN: r0=4(x1), r1=89(y1), r2=48(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 89
LDI r2, 48
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
