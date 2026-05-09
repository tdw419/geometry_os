; DESCRIPTION: Renders a yellow line between points (77, 180) and (366, 48).
; PLAN: r0=77(x1), r1=180(y1), r2=366(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 180
LDI r2, 366
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
