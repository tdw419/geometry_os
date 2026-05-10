; DESCRIPTION: Renders a red line between points (244, 160) and (266, 141).
; PLAN: r0=244(x1), r1=160(y1), r2=266(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 160
LDI r2, 266
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
