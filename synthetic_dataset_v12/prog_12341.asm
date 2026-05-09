; DESCRIPTION: Renders a white line between points (193, 31) and (369, 123).
; PLAN: r0=193(x1), r1=31(y1), r2=369(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 31
LDI r2, 369
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
