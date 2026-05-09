; DESCRIPTION: Renders a white line between points (448, 243) and (116, 105).
; PLAN: r0=448(x1), r1=243(y1), r2=116(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 243
LDI r2, 116
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
