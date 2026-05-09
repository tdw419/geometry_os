; DESCRIPTION: Renders a green line between points (190, 51) and (22, 156).
; PLAN: r0=190(x1), r1=51(y1), r2=22(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 51
LDI r2, 22
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
