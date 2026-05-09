; DESCRIPTION: Renders a red line between points (133, 8) and (175, 50).
; PLAN: r0=133(x1), r1=8(y1), r2=175(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 8
LDI r2, 175
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
