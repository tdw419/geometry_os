; DESCRIPTION: Renders a green line between points (137, 13) and (364, 159).
; PLAN: r0=137(x1), r1=13(y1), r2=364(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 13
LDI r2, 364
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
