; DESCRIPTION: Renders a purple line between points (509, 56) and (374, 36).
; PLAN: r0=509(x1), r1=56(y1), r2=374(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 56
LDI r2, 374
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
