; DESCRIPTION: Renders a red line between points (75, 66) and (47, 167).
; PLAN: r0=75(x1), r1=66(y1), r2=47(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 66
LDI r2, 47
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
