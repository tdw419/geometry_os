; DESCRIPTION: Renders a red line between points (258, 51) and (241, 5).
; PLAN: r0=258(x1), r1=51(y1), r2=241(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 51
LDI r2, 241
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
