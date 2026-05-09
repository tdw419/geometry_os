; DESCRIPTION: Renders a black line between points (186, 80) and (287, 82).
; PLAN: r0=186(x1), r1=80(y1), r2=287(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 80
LDI r2, 287
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
