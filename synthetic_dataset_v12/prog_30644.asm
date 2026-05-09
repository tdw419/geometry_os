; DESCRIPTION: Renders a red line between points (17, 236) and (363, 71).
; PLAN: r0=17(x1), r1=236(y1), r2=363(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 236
LDI r2, 363
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
