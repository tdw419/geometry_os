; DESCRIPTION: Renders a black line between points (74, 117) and (448, 68).
; PLAN: r0=74(x1), r1=117(y1), r2=448(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 117
LDI r2, 448
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
