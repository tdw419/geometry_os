; DESCRIPTION: Renders a white line between points (89, 103) and (491, 177).
; PLAN: r0=89(x1), r1=103(y1), r2=491(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 103
LDI r2, 491
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
