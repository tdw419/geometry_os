; DESCRIPTION: Renders a yellow line between points (60, 100) and (161, 124).
; PLAN: r0=60(x1), r1=100(y1), r2=161(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 100
LDI r2, 161
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
