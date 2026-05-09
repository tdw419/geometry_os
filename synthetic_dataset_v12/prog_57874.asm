; DESCRIPTION: Renders a red line between points (211, 20) and (4, 57).
; PLAN: r0=211(x1), r1=20(y1), r2=4(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 20
LDI r2, 4
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
