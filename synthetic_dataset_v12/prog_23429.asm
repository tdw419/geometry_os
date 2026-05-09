; DESCRIPTION: Renders a red line between points (266, 0) and (244, 18).
; PLAN: r0=266(x1), r1=0(y1), r2=244(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 0
LDI r2, 244
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
