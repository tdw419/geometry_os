; DESCRIPTION: Renders a red line between points (91, 129) and (237, 88).
; PLAN: r0=91(x1), r1=129(y1), r2=237(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 129
LDI r2, 237
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
