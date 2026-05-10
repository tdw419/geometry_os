; DESCRIPTION: Renders a yellow line between points (38, 120) and (451, 25).
; PLAN: r0=38(x1), r1=120(y1), r2=451(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 120
LDI r2, 451
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
