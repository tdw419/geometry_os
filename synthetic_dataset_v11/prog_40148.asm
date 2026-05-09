; DESCRIPTION: Renders a purple line between points (80, 47) and (104, 154).
; PLAN: r0=80(x1), r1=47(y1), r2=104(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 47
LDI r2, 104
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
