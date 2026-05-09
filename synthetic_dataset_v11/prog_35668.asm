; DESCRIPTION: Renders a red line between points (2, 56) and (144, 211).
; PLAN: r0=2(x1), r1=56(y1), r2=144(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 56
LDI r2, 144
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
