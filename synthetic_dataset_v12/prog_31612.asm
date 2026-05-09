; DESCRIPTION: Renders a red line between points (191, 104) and (49, 24).
; PLAN: r0=191(x1), r1=104(y1), r2=49(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 104
LDI r2, 49
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
