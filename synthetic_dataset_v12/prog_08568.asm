; DESCRIPTION: Renders a green line between points (186, 35) and (34, 97).
; PLAN: r0=186(x1), r1=35(y1), r2=34(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 35
LDI r2, 34
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
