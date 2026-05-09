; DESCRIPTION: Renders a white line between points (250, 158) and (143, 237).
; PLAN: r0=250(x1), r1=158(y1), r2=143(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 158
LDI r2, 143
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
