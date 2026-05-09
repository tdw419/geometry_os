; DESCRIPTION: Renders a red line between points (227, 66) and (71, 24).
; PLAN: r0=227(x1), r1=66(y1), r2=71(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 66
LDI r2, 71
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
