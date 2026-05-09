; DESCRIPTION: Renders a red line between points (250, 122) and (204, 24).
; PLAN: r0=250(x1), r1=122(y1), r2=204(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 122
LDI r2, 204
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
