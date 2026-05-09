; DESCRIPTION: Renders a yellow line between points (85, 53) and (124, 117).
; PLAN: r0=85(x1), r1=53(y1), r2=124(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 53
LDI r2, 124
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
