; DESCRIPTION: Renders a green line between points (22, 76) and (51, 204).
; PLAN: r0=22(x1), r1=76(y1), r2=51(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 76
LDI r2, 51
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
