; DESCRIPTION: Renders a red line between points (440, 81) and (230, 106).
; PLAN: r0=440(x1), r1=81(y1), r2=230(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 81
LDI r2, 230
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
