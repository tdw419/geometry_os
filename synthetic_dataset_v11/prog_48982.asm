; DESCRIPTION: Renders a red line between points (185, 142) and (244, 52).
; PLAN: r0=185(x1), r1=142(y1), r2=244(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 142
LDI r2, 244
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
