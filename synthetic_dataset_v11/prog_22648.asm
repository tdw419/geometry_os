; DESCRIPTION: Renders a yellow line between points (180, 74) and (188, 253).
; PLAN: r0=180(x1), r1=74(y1), r2=188(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 74
LDI r2, 188
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
