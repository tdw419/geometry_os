; DESCRIPTION: Renders a red line between points (471, 208) and (226, 161).
; PLAN: r0=471(x1), r1=208(y1), r2=226(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 208
LDI r2, 226
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
