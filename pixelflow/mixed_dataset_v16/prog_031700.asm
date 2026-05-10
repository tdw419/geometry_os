; DESCRIPTION: Renders a black line between points (231, 80) and (374, 20).
; PLAN: r0=231(x1), r1=80(y1), r2=374(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 80
LDI r2, 374
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
