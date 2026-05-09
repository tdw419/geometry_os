; DESCRIPTION: Renders a blue line between points (407, 47) and (109, 249).
; PLAN: r0=407(x1), r1=47(y1), r2=109(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 47
LDI r2, 109
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
