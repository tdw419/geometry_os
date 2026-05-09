; DESCRIPTION: Renders a red line between points (505, 129) and (88, 248).
; PLAN: r0=505(x1), r1=129(y1), r2=88(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 129
LDI r2, 88
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
