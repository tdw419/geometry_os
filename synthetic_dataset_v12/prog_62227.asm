; DESCRIPTION: Renders a orange line between points (369, 237) and (138, 237).
; PLAN: r0=369(x1), r1=237(y1), r2=138(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 237
LDI r2, 138
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
