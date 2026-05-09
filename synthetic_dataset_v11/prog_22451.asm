; DESCRIPTION: Renders a purple line between points (47, 186) and (245, 56).
; PLAN: r0=47(x1), r1=186(y1), r2=245(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 186
LDI r2, 245
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
