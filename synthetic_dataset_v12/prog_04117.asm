; DESCRIPTION: Renders a green line between points (441, 150) and (363, 10).
; PLAN: r0=441(x1), r1=150(y1), r2=363(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 150
LDI r2, 363
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
