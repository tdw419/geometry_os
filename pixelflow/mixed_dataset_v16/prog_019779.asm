; DESCRIPTION: Renders a black line between points (363, 161) and (192, 40).
; PLAN: r0=363(x1), r1=161(y1), r2=192(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 161
LDI r2, 192
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
