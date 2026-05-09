; DESCRIPTION: Renders a red line between points (230, 78) and (40, 233).
; PLAN: r0=230(x1), r1=78(y1), r2=40(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 78
LDI r2, 40
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
