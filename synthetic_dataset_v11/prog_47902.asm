; DESCRIPTION: Renders a white line between points (72, 136) and (51, 92).
; PLAN: r0=72(x1), r1=136(y1), r2=51(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 136
LDI r2, 51
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
