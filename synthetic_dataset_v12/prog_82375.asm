; DESCRIPTION: Renders a red line between points (236, 13) and (204, 70).
; PLAN: r0=236(x1), r1=13(y1), r2=204(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 13
LDI r2, 204
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
