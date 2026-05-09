; DESCRIPTION: Renders a green line between points (141, 108) and (6, 85).
; PLAN: r0=141(x1), r1=108(y1), r2=6(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 108
LDI r2, 6
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
