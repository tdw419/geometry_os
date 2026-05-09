; DESCRIPTION: Renders a yellow line between points (195, 74) and (95, 148).
; PLAN: r0=195(x1), r1=74(y1), r2=95(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 74
LDI r2, 95
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
