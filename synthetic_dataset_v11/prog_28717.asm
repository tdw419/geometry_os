; DESCRIPTION: Renders a blue line between points (15, 124) and (223, 45).
; PLAN: r0=15(x1), r1=124(y1), r2=223(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 124
LDI r2, 223
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
