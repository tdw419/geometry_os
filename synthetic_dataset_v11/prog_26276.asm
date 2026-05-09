; DESCRIPTION: Renders a red line between points (106, 120) and (85, 182).
; PLAN: r0=106(x1), r1=120(y1), r2=85(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 120
LDI r2, 85
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
