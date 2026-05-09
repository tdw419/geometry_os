; DESCRIPTION: Renders a red line between points (208, 226) and (379, 74).
; PLAN: r0=208(x1), r1=226(y1), r2=379(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 226
LDI r2, 379
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
