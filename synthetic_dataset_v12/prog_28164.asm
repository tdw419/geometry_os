; DESCRIPTION: Renders a green line between points (353, 58) and (374, 247).
; PLAN: r0=353(x1), r1=58(y1), r2=374(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 58
LDI r2, 374
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
