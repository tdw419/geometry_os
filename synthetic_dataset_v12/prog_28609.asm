; DESCRIPTION: Renders a red line between points (374, 229) and (489, 204).
; PLAN: r0=374(x1), r1=229(y1), r2=489(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 229
LDI r2, 489
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
