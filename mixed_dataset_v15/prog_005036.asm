; DESCRIPTION: Renders a yellow line between points (415, 201) and (80, 104).
; PLAN: r0=415(x1), r1=201(y1), r2=80(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 201
LDI r2, 80
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
