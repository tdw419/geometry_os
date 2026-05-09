; DESCRIPTION: Renders a yellow line between points (169, 220) and (226, 177).
; PLAN: r0=169(x1), r1=220(y1), r2=226(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 220
LDI r2, 226
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
