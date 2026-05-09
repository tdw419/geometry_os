; DESCRIPTION: Renders a black line between points (148, 186) and (4, 185).
; PLAN: r0=148(x1), r1=186(y1), r2=4(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 186
LDI r2, 4
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
