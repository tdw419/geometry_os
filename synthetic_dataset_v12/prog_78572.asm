; DESCRIPTION: Renders a yellow line between points (208, 51) and (236, 100).
; PLAN: r0=208(x1), r1=51(y1), r2=236(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 51
LDI r2, 236
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
