; DESCRIPTION: Renders a black line between points (192, 51) and (84, 87).
; PLAN: r0=192(x1), r1=51(y1), r2=84(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 51
LDI r2, 84
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
