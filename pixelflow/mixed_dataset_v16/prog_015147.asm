; DESCRIPTION: Renders a green line between points (449, 185) and (51, 248).
; PLAN: r0=449(x1), r1=185(y1), r2=51(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 185
LDI r2, 51
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
