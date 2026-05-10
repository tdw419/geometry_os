; DESCRIPTION: Renders a white line between points (91, 51) and (377, 10).
; PLAN: r0=91(x1), r1=51(y1), r2=377(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 51
LDI r2, 377
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
