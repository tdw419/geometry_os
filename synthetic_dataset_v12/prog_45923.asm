; DESCRIPTION: Renders a yellow line between points (411, 73) and (143, 54).
; PLAN: r0=411(x1), r1=73(y1), r2=143(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 73
LDI r2, 143
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
