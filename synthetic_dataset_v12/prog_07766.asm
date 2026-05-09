; DESCRIPTION: Renders a red line between points (280, 100) and (140, 243).
; PLAN: r0=280(x1), r1=100(y1), r2=140(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 100
LDI r2, 140
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
