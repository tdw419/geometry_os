; DESCRIPTION: Renders a red line between points (43, 178) and (47, 71).
; PLAN: r0=43(x1), r1=178(y1), r2=47(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 178
LDI r2, 47
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
