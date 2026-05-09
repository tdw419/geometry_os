; DESCRIPTION: Renders a white line between points (148, 229) and (250, 237).
; PLAN: r0=148(x1), r1=229(y1), r2=250(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 229
LDI r2, 250
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
