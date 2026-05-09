; DESCRIPTION: Renders a yellow line between points (94, 54) and (443, 36).
; PLAN: r0=94(x1), r1=54(y1), r2=443(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 54
LDI r2, 443
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
