; DESCRIPTION: Renders a red line between points (211, 125) and (14, 120).
; PLAN: r0=211(x1), r1=125(y1), r2=14(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 125
LDI r2, 14
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
