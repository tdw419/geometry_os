; DESCRIPTION: Renders a cyan line between points (500, 169) and (328, 119).
; PLAN: r0=500(x1), r1=169(y1), r2=328(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 169
LDI r2, 328
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
