; DESCRIPTION: Renders a yellow line between points (193, 216) and (120, 34).
; PLAN: r0=193(x1), r1=216(y1), r2=120(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 216
LDI r2, 120
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
