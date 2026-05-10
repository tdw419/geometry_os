; DESCRIPTION: Renders a red line between points (454, 83) and (227, 24).
; PLAN: r0=454(x1), r1=83(y1), r2=227(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 83
LDI r2, 227
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
