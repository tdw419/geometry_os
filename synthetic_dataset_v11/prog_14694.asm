; DESCRIPTION: Renders a red line between points (198, 89) and (26, 192).
; PLAN: r0=198(x1), r1=89(y1), r2=26(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 89
LDI r2, 26
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
