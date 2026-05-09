; DESCRIPTION: Renders a black line between points (80, 113) and (101, 79).
; PLAN: r0=80(x1), r1=113(y1), r2=101(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 113
LDI r2, 101
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
