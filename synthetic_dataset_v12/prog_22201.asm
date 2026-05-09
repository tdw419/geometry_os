; DESCRIPTION: Renders a black line between points (279, 25) and (423, 84).
; PLAN: r0=279(x1), r1=25(y1), r2=423(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 25
LDI r2, 423
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
