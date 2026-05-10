; DESCRIPTION: Renders a red line between points (259, 6) and (325, 160).
; PLAN: r0=259(x1), r1=6(y1), r2=325(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 6
LDI r2, 325
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
