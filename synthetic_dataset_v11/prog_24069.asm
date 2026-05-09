; DESCRIPTION: Renders a yellow line between points (75, 48) and (138, 169).
; PLAN: r0=75(x1), r1=48(y1), r2=138(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 48
LDI r2, 138
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
