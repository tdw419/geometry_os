; DESCRIPTION: Renders a yellow line between points (363, 128) and (250, 211).
; PLAN: r0=363(x1), r1=128(y1), r2=250(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 128
LDI r2, 250
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
