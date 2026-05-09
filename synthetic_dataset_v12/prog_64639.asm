; DESCRIPTION: Renders a white line between points (142, 10) and (332, 51).
; PLAN: r0=142(x1), r1=10(y1), r2=332(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 10
LDI r2, 332
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
