; DESCRIPTION: Renders a red line between points (219, 202) and (290, 169).
; PLAN: r0=219(x1), r1=202(y1), r2=290(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 202
LDI r2, 290
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
