; DESCRIPTION: Renders a green line between points (9, 133) and (163, 96).
; PLAN: r0=9(x1), r1=133(y1), r2=163(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 133
LDI r2, 163
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
