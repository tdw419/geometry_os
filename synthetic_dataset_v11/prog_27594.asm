; DESCRIPTION: Renders a purple line between points (91, 206) and (245, 14).
; PLAN: r0=91(x1), r1=206(y1), r2=245(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 206
LDI r2, 245
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
