; DESCRIPTION: Renders a yellow line between points (126, 133) and (302, 204).
; PLAN: r0=126(x1), r1=133(y1), r2=302(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 133
LDI r2, 302
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
