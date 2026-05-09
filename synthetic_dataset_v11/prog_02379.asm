; DESCRIPTION: Renders a blue line between points (123, 240) and (251, 169).
; PLAN: r0=123(x1), r1=240(y1), r2=251(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 240
LDI r2, 251
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
