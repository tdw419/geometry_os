; DESCRIPTION: Renders a black line between points (152, 115) and (238, 185).
; PLAN: r0=152(x1), r1=115(y1), r2=238(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 115
LDI r2, 238
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
