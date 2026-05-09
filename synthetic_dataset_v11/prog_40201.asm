; DESCRIPTION: Renders a yellow line between points (85, 1) and (62, 117).
; PLAN: r0=85(x1), r1=1(y1), r2=62(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 1
LDI r2, 62
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
