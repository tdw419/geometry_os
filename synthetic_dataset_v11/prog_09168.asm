; DESCRIPTION: Renders a red line between points (231, 104) and (100, 104).
; PLAN: r0=231(x1), r1=104(y1), r2=100(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 104
LDI r2, 100
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
