; DESCRIPTION: Renders a white line between points (250, 85) and (6, 105).
; PLAN: r0=250(x1), r1=85(y1), r2=6(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 85
LDI r2, 6
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
