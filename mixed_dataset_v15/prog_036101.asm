; DESCRIPTION: Renders a red line between points (459, 38) and (318, 12).
; PLAN: r0=459(x1), r1=38(y1), r2=318(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 38
LDI r2, 318
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
