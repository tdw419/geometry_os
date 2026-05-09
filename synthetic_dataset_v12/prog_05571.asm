; DESCRIPTION: Renders a red line between points (196, 169) and (420, 216).
; PLAN: r0=196(x1), r1=169(y1), r2=420(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 169
LDI r2, 420
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
