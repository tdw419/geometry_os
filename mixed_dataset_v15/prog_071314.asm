; DESCRIPTION: Renders a white line between points (464, 89) and (92, 72).
; PLAN: r0=464(x1), r1=89(y1), r2=92(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 89
LDI r2, 92
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
