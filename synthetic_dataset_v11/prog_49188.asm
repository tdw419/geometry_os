; DESCRIPTION: Renders a red line between points (137, 254) and (109, 21).
; PLAN: r0=137(x1), r1=254(y1), r2=109(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 254
LDI r2, 109
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
