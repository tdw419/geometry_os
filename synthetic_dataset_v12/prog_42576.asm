; DESCRIPTION: Renders a purple line between points (245, 11) and (103, 225).
; PLAN: r0=245(x1), r1=11(y1), r2=103(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 11
LDI r2, 103
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
