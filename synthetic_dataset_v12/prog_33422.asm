; DESCRIPTION: Renders a yellow line between points (193, 187) and (226, 169).
; PLAN: r0=193(x1), r1=187(y1), r2=226(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 187
LDI r2, 226
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
