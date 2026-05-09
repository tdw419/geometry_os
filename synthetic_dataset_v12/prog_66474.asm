; DESCRIPTION: Renders a black line between points (36, 6) and (110, 44).
; PLAN: r0=36(x1), r1=6(y1), r2=110(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 6
LDI r2, 110
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
