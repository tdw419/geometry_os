; DESCRIPTION: Renders a red line between points (373, 144) and (329, 169).
; PLAN: r0=373(x1), r1=144(y1), r2=329(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 144
LDI r2, 329
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
