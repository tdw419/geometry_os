; DESCRIPTION: Renders a red line between points (145, 90) and (90, 223).
; PLAN: r0=145(x1), r1=90(y1), r2=90(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 90
LDI r2, 90
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
