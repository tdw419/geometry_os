; DESCRIPTION: Renders a red line between points (137, 204) and (260, 101).
; PLAN: r0=137(x1), r1=204(y1), r2=260(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 204
LDI r2, 260
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
