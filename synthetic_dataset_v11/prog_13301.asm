; DESCRIPTION: Renders a white line between points (134, 147) and (2, 1).
; PLAN: r0=134(x1), r1=147(y1), r2=2(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 147
LDI r2, 2
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
