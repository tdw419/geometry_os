; DESCRIPTION: Renders a yellow line between points (137, 64) and (51, 0).
; PLAN: r0=137(x1), r1=64(y1), r2=51(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 64
LDI r2, 51
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
