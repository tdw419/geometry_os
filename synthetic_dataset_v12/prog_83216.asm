; DESCRIPTION: Renders a red line between points (87, 160) and (506, 136).
; PLAN: r0=87(x1), r1=160(y1), r2=506(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 160
LDI r2, 506
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
