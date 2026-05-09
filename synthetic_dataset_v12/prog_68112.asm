; DESCRIPTION: Renders a red line between points (47, 83) and (176, 141).
; PLAN: r0=47(x1), r1=83(y1), r2=176(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 83
LDI r2, 176
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
