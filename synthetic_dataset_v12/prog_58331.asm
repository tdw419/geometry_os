; DESCRIPTION: Renders a green line between points (51, 51) and (68, 237).
; PLAN: r0=51(x1), r1=51(y1), r2=68(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 51
LDI r2, 68
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
