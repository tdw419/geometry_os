; DESCRIPTION: Renders a cyan line between points (347, 169) and (24, 237).
; PLAN: r0=347(x1), r1=169(y1), r2=24(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 169
LDI r2, 24
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
