; DESCRIPTION: Renders a white line between points (145, 179) and (120, 17).
; PLAN: r0=145(x1), r1=179(y1), r2=120(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 179
LDI r2, 120
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
