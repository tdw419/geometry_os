; DESCRIPTION: Renders a white line between points (248, 51) and (31, 95).
; PLAN: r0=248(x1), r1=51(y1), r2=31(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 51
LDI r2, 31
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
