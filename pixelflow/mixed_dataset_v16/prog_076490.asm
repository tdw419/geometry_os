; DESCRIPTION: Renders a green line between points (318, 186) and (484, 193).
; PLAN: r0=318(x1), r1=186(y1), r2=484(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 186
LDI r2, 484
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
