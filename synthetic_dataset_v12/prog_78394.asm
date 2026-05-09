; DESCRIPTION: Renders a black line between points (109, 254) and (377, 19).
; PLAN: r0=109(x1), r1=254(y1), r2=377(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 254
LDI r2, 377
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
