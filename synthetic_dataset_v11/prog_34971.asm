; DESCRIPTION: Renders a black line between points (200, 55) and (72, 81).
; PLAN: r0=200(x1), r1=55(y1), r2=72(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 55
LDI r2, 72
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
