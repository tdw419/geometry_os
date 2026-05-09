; DESCRIPTION: Renders a red line between points (133, 8) and (435, 33).
; PLAN: r0=133(x1), r1=8(y1), r2=435(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 8
LDI r2, 435
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
