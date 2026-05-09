; DESCRIPTION: Renders a yellow line between points (248, 58) and (188, 126).
; PLAN: r0=248(x1), r1=58(y1), r2=188(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 58
LDI r2, 188
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
