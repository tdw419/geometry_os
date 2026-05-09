; DESCRIPTION: Renders a red line between points (448, 199) and (375, 88).
; PLAN: r0=448(x1), r1=199(y1), r2=375(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 199
LDI r2, 375
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
