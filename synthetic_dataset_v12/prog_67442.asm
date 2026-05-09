; DESCRIPTION: Renders a red line between points (111, 80) and (374, 237).
; PLAN: r0=111(x1), r1=80(y1), r2=374(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 80
LDI r2, 374
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
