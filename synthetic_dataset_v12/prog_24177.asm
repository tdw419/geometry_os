; DESCRIPTION: Renders a red line between points (202, 106) and (208, 143).
; PLAN: r0=202(x1), r1=106(y1), r2=208(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 106
LDI r2, 208
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
