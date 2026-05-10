; DESCRIPTION: Renders a yellow line between points (471, 32) and (51, 24).
; PLAN: r0=471(x1), r1=32(y1), r2=51(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 32
LDI r2, 51
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
