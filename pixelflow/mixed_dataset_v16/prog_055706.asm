; DESCRIPTION: Renders a red line between points (157, 20) and (98, 105).
; PLAN: r0=157(x1), r1=20(y1), r2=98(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 20
LDI r2, 98
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
