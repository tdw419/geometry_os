; DESCRIPTION: Renders a black line between points (92, 188) and (191, 78).
; PLAN: r0=92(x1), r1=188(y1), r2=191(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 188
LDI r2, 191
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
