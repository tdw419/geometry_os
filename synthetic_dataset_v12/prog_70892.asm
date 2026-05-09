; DESCRIPTION: Renders a red line between points (21, 25) and (217, 185).
; PLAN: r0=21(x1), r1=25(y1), r2=217(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 25
LDI r2, 217
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
