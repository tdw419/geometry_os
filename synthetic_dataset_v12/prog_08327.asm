; DESCRIPTION: Renders a cyan line between points (347, 22) and (478, 144).
; PLAN: r0=347(x1), r1=22(y1), r2=478(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 22
LDI r2, 478
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
