; DESCRIPTION: Renders a yellow line between points (504, 104) and (183, 109).
; PLAN: r0=504(x1), r1=104(y1), r2=183(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 104
LDI r2, 183
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
