; DESCRIPTION: Renders a yellow line between points (65, 104) and (335, 23).
; PLAN: r0=65(x1), r1=104(y1), r2=335(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 104
LDI r2, 335
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
