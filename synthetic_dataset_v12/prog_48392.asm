; DESCRIPTION: Renders a black line between points (250, 232) and (404, 90).
; PLAN: r0=250(x1), r1=232(y1), r2=404(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 232
LDI r2, 404
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
