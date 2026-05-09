; DESCRIPTION: Renders a red line between points (95, 71) and (47, 132).
; PLAN: r0=95(x1), r1=71(y1), r2=47(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 71
LDI r2, 47
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
