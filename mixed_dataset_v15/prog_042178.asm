; DESCRIPTION: Renders a red line between points (172, 202) and (454, 115).
; PLAN: r0=172(x1), r1=202(y1), r2=454(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 202
LDI r2, 454
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
