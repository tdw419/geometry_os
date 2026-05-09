; DESCRIPTION: Renders a green line between points (176, 51) and (5, 241).
; PLAN: r0=176(x1), r1=51(y1), r2=5(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 51
LDI r2, 5
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
