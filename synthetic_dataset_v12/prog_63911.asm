; DESCRIPTION: Renders a red line between points (26, 149) and (229, 247).
; PLAN: r0=26(x1), r1=149(y1), r2=229(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 149
LDI r2, 229
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
