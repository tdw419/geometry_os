; DESCRIPTION: Renders a red line between points (71, 3) and (185, 74).
; PLAN: r0=71(x1), r1=3(y1), r2=185(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 3
LDI r2, 185
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
