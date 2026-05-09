; DESCRIPTION: Renders a black line between points (4, 86) and (133, 20).
; PLAN: r0=4(x1), r1=86(y1), r2=133(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 86
LDI r2, 133
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
