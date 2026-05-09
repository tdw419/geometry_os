; DESCRIPTION: Renders a white line between points (184, 53) and (369, 155).
; PLAN: r0=184(x1), r1=53(y1), r2=369(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 53
LDI r2, 369
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
