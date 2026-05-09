; DESCRIPTION: Renders a red line between points (95, 44) and (427, 126).
; PLAN: r0=95(x1), r1=44(y1), r2=427(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 44
LDI r2, 427
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
