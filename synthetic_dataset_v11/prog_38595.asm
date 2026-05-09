; DESCRIPTION: Renders a red line between points (36, 71) and (153, 43).
; PLAN: r0=36(x1), r1=71(y1), r2=153(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 71
LDI r2, 153
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
