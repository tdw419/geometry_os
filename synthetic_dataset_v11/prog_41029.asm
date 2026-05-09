; DESCRIPTION: Renders a yellow line between points (137, 60) and (211, 150).
; PLAN: r0=137(x1), r1=60(y1), r2=211(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 60
LDI r2, 211
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
