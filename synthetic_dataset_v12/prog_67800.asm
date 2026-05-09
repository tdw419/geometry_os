; DESCRIPTION: Renders a yellow line between points (467, 80) and (374, 13).
; PLAN: r0=467(x1), r1=80(y1), r2=374(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 80
LDI r2, 374
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
