; DESCRIPTION: Renders a red line between points (80, 13) and (104, 74).
; PLAN: r0=80(x1), r1=13(y1), r2=104(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 13
LDI r2, 104
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
