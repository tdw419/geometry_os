; DESCRIPTION: Renders a red line between points (97, 248) and (197, 169).
; PLAN: r0=97(x1), r1=248(y1), r2=197(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 248
LDI r2, 197
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
